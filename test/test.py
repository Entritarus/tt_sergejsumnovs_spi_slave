# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

# ui_in signal indices
TIMER_CAPTURE0 = 0
TIMER_CAPTURE1 = 1
TIMER_CAPTURE2 = 2
TIMER_CAPTURE3 = 3
TIMER_CAPTURE4 = 4
TIMER_CAPTURE5 = 5
TIMER_CAPTURE6 = 6
TIMER_CAPTURE7 = 7

# uio signal indices
SPI_MSEL = 0
SPI_MOSI = 1
SPI_MISO = 2
SPI_MCLK = 3
GPIO0 = 4
GPIO1 = 5
GPIO2 = 6
GPIO3 = 7

# uo_out signal indices
TIMER_PWM0 = 0
TIMER_PWM1 = 1
TIMER_PWM2 = 2
TIMER_PWM3 = 3
LFSR_OUT = 4

SPI_SYNC_STAGES = 2

CLK_PERIOD = 50 # ns (20 MHz)
SPI_MCLK_PERIOD = 100 # ns (10 MHz)



@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    clock = Clock(dut.clk, CLK_PERIOD, units="ns")
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0b00000000
    dut.uio_in.value = (1 << SPI_MSEL) | (1 << SPI_MCLK)
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    dut._log.info("Test project behavior")

    # Set the input values you want to test
    #dut.ui_in.value = 20
    #dut.uio_in.value = 30

    # Wait for one clock cycle to see the output values
    #await ClockCycles(dut.clk, 1)

    # The following assersion is just an example of how to check the output values.
    # Change it to match the actual expected output of your module:


    # Keep testing the module by changing the input values, waiting for
    # one or more clock cycles, and asserting the expected output values.
    
    await spi_write(dut, 0x86, 0x01);
    await ClockCycles(dut.clk, 10)

    await ClockCycles(dut.clk, 10)
    assert dut.uio_oe.value == (1 << SPI_MISO) | (1 << GPIO0)


def modify_bit(data1, bit1, data2, bit2):
  data1_reset_bit = data1 & (~(1 << bit1))
  data1_with_new_bit = data1_reset_bit | (((data2 >> bit2) & 1) << bit1)
  return data1_with_new_bit

def set_bit(data, bit):
  return data | (1 << bit)

def clear_bit(data, bit):
  return data & ~(1 << bit)
  
  
async def spi_write(dut, addr, data):
  io_in_prepared = 0b00001000

  for bit in range(7,-1, -1):
    io_in_prepared = modify_bit(io_in_prepared, SPI_MOSI, addr, bit)
    io_in_prepared = clear_bit(io_in_prepared, SPI_MCLK)

    dut.uio_in.value = io_in_prepared
    await ClockCycles(dut.clk, int(SPI_MCLK_PERIOD/2))

    io_in_prepared = set_bit(io_in_prepared, SPI_MCLK)
    dut.uio_in.value = io_in_prepared
    await ClockCycles(dut.clk, int(SPI_MCLK_PERIOD/2))

  await ClockCycles(dut.clk, SPI_SYNC_STAGES+1)

  for bit in range(7,-1, -1):
    io_in_prepared = modify_bit(io_in_prepared, SPI_MOSI, data, bit)
    io_in_prepared = clear_bit(io_in_prepared, SPI_MCLK)

    dut.uio_in.value = io_in_prepared
    await ClockCycles(dut.clk, int(SPI_MCLK_PERIOD/2))

    io_in_prepared = set_bit(io_in_prepared, SPI_MCLK)
    dut.uio_in.value = io_in_prepared
    await ClockCycles(dut.clk, int(SPI_MCLK_PERIOD/2))
    

  await ClockCycles(dut.clk, SPI_SYNC_STAGES+1)
    


