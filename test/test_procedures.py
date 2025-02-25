import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, Timer, RisingEdge, FallingEdge

from constants import *
from bit_operations import *
from spi_tb_functions import *

async def dut_reset(dut):
  dut._log.info("Reset")
  dut.ena.value = 1
  dut.ui_in.value = 0b00000000
  dut.uio_in.value = (1 << SPI_MSEL) | (1 << SPI_MCLK)
  dut.rst_n.value = 0
  await ClockCycles(dut.clk, 10)
  dut.rst_n.value = 1
  await RisingEdge(dut.clk)

def print_info(dut, info_str):
  dut._log.info(info_str)

async def test_gpio(dut):
  await dut_reset(dut)
  dut._log.info("Testing GPIO...")

  dut.uio_in.value = set_bit(dut.uio_in.value, SPI_MSEL)
  dut.uio_in.value = set_bit(dut.uio_in.value, SPI_MCLK)
  gpio_dirs = random.randint(0, GPIO_COUNT-1)
  gpio_output = gpio_dirs
  gpio_input = (~gpio_dirs) & (GPIO_MSK >> GPIO0)
  print_info(dut, f"dirs == 0x%x" % (gpio_dirs))
  print_info(dut, f"input == 0x%x" % (gpio_input))
  dut.uio_in.value |= gpio_input << GPIO0
  await ClockCycles(dut.clk, 1)

  await spi_write(dut, RM_GPIO_DIR, gpio_dirs)
  assert dut.uio_oe.value == (1 << SPI_MISO) | (gpio_dirs << GPIO0)
  
  await ClockCycles(dut.clk, 10)

  gpio_read_data = await spi_read(dut, RM_GPIO_RDATA)
  print_info(dut, f"gpio read data == 0x%x" % (gpio_read_data))
  assert gpio_read_data == gpio_input

  await spi_write(dut, RM_GPIO_WDATA, gpio_output)
  print_info(dut, f"gpio write data == 0x%x" % (gpio_output))
  assert (dut.uio_out.value & GPIO_MSK) == (gpio_output << GPIO0)

  await spi_write(dut, RM_GPIO_DIR, 0)
  await ClockCycles(dut.clk, 1)

async def test_lfsr(dut):
  await dut_reset(dut)
  print_info(dut, "Testing LFSR...")

  lfsr_ctl = 0
  lfsr_ctl = set_bit(lfsr_ctl, LFSR_EN)
  lfsr_ctl = set_bit(lfsr_ctl, LFSR_LOAD)

  await spi_write(dut, RM_LFSR_POLY, LFSR_MAX_N_POLYNOME)
  await spi_write(dut, RM_LFSR_IDATA, LFSR_INIT_STATE)
  await spi_write(dut, RM_LFSR_CTL, lfsr_ctl)

  lfsr_ctl = clear_bit(lfsr_ctl, LFSR_LOAD)

  await spi_write(dut, RM_LFSR_CTL, lfsr_ctl)
  
  await FallingEdge(dut.clk)

  while (get_bit(dut.uo_out.value, LFSR_OUT) == 0):
    await RisingEdge(dut.clk)
  
  lfsr_reg = 0x80
  for i in range(1, 2**LFSR_WIDTH+1):
    assert get_bit(lfsr_reg, 7) == get_bit(dut.uo_out.value, LFSR_OUT)
    do_xor = get_bit(lfsr_reg, 7) == 1
    lfsr_reg <<= 1
    if do_xor:
      lfsr_reg ^= LFSR_MAX_N_POLYNOME
      lfsr_reg &= LFSR_MSK

    await ClockCycles(dut.clk, 1)


async def test_pwm(dut):
  await dut_reset(dut)
  print_info(dut, "Testing timer PWM...")

  pwm_tops = []
  for i in range(0, TIMER_PWM_COUNT):
    pwm_tops.append(random.randint(0, 2**TIMER_WIDTH-1))
    await spi_write(dut, RM_TIMER_PWM0_TOP + i, pwm_tops[i])

  clk_divisor = random.randint(0, 2**TIMER_WIDTH-1)
  await spi_write(dut, RM_TIMER_CLK_DIV, clk_divisor)

  timer_ctl = 1 # timer has already started in the DUT
  timer_ctl = set_bit(timer_ctl, TIMER_EN)
  timer_ctl = set_bit(timer_ctl, TIMER_EN_PWM)
  await spi_write(dut, RM_TIMER_CTL, timer_ctl)
  
  #await ClockCycles(dut.clk, 1)
  print_info(dut, "pwm signals: 0x%x" % (dut.uo_out.value & 0xf))

  test_timer = 0
  test_pwm = []
  for i in range(0, TIMER_PWM_COUNT):
    test_pwm.append(0)

  for v in range(0, 2**TIMER_WIDTH):
    for i in range(0, TIMER_PWM_COUNT):
      test_pwm[i] = 0

    for p in range(0, TIMER_PWM_COUNT):
      test_pwm[p] = 1
      if test_timer >= pwm_tops[p]:
        test_pwm[p] = 0
      assert test_pwm[p] == get_bit(dut.uo_out.value, TIMER_PWM0 + p)

    for t in range(0, clk_divisor+1):
      await ClockCycles(dut.clk, 1)

    test_timer += 1
    if test_timer == 2**TIMER_WIDTH:
      test_timer = 0


async def test_capture(dut):
  await dut_reset(dut)
  print_info(dut, "Testing timer capture...")
  
  capture_edges = 0xff # all to rising

  await spi_write(dut, RM_TIMER_CAPT_CTL, capture_edges)

  timer_ctl = 0
  timer_ctl = set_bit(timer_ctl, TIMER_EN)
  timer_ctl = set_bit(timer_ctl, TIMER_EN_CAPT)
  await spi_write(dut, RM_TIMER_CTL, timer_ctl)

  await FallingEdge(dut.clk)

  event_spacing = random.randint(0, 2**TIMER_WIDTH-1)
  first_event_index = random.randint(0, TIMER_CAPTURE_COUNT-1)
  second_event_index = random.randint(0, TIMER_CAPTURE_COUNT-1)
  if first_event_index == second_event_index:
    second_event_index = (first_event_index + 1) % TIMER_CAPTURE_COUNT

  dut.ui_in.value = set_bit(dut.ui_in.value, first_event_index)
  await Timer(CLK_PERIOD, "ns")
  dut.ui_in.value = clear_bit(dut.ui_in.value, first_event_index)

  await Timer(CLK_PERIOD*(event_spacing-1), "ns") # time is between rising edges

  dut.ui_in.value = set_bit(dut.ui_in.value, second_event_index)
  await Timer(CLK_PERIOD, "ns")
  dut.ui_in.value = clear_bit(dut.ui_in.value, second_event_index)

  await ClockCycles(dut.clk, TIMER_CAPT_SYNC_STAGES + 2) # just to be sure

  first_event_time = await spi_read(dut, RM_TIMER_CAPTURE0 + first_event_index)
  second_event_time = await spi_read(dut, RM_TIMER_CAPTURE0 + second_event_index)
  
  if second_event_time < first_event_time: # if timer overflows between events
    second_event_time += 2**TIMER_WIDTH
    
  delta_time = second_event_time - first_event_time
  
  assert delta_time == event_spacing
  





