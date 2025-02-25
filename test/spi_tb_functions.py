
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, Timer, RisingEdge

from constants import *
from bit_operations import *

async def spi_write(dut, addr, data):
  io_in_prepared = dut.uio_in.value & ~(1 << SPI_MSEL)

  write_addr = set_bit(addr, 7)

  for bit in range(7,-1, -1):
    io_in_prepared = copy_bit(io_in_prepared, SPI_MOSI, write_addr, bit)
    io_in_prepared = clear_bit(io_in_prepared, SPI_MCLK)

    dut.uio_in.value = io_in_prepared
    await Timer(int(SPI_CLK_PERIOD/2), "ns")

    io_in_prepared = set_bit(io_in_prepared, SPI_MCLK)
    dut.uio_in.value = io_in_prepared
    await Timer(int(SPI_CLK_PERIOD/2), "ns")

  await ClockCycles(dut.clk, SPI_SYNC_STAGES+1)

  for bit in range(7,-1, -1):
    io_in_prepared = copy_bit(io_in_prepared, SPI_MOSI, data, bit)
    io_in_prepared = clear_bit(io_in_prepared, SPI_MCLK)

    dut.uio_in.value = io_in_prepared
    await Timer(int(SPI_CLK_PERIOD/2), "ns")

    io_in_prepared = set_bit(io_in_prepared, SPI_MCLK)
    dut.uio_in.value = io_in_prepared
    await Timer(int(SPI_CLK_PERIOD/2), "ns")
    

  await ClockCycles(dut.clk, SPI_SYNC_STAGES+1) # Sync delay
  await ClockCycles(dut.clk, 1+1) # regmap and component register delay
  io_in_prepared = set_bit(io_in_prepared, SPI_MCLK)
  io_in_prepared = set_bit(io_in_prepared, SPI_MSEL)
  dut.uio_in.value = io_in_prepared;
  await RisingEdge(dut.clk)
    

async def spi_read(dut, addr):
  io_in_prepared = dut.uio_in.value & ~(1 << SPI_MSEL)
  #io_in_prepared = (1 << SPI_MCLK)
  #clear_bit(io_in_prepared, SPI_MSEL)

  read_data = 0

  for bit in range(7,-1, -1):
    io_in_prepared = copy_bit(io_in_prepared, SPI_MOSI, addr, bit)
    io_in_prepared = clear_bit(io_in_prepared, SPI_MCLK)

    dut.uio_in.value = io_in_prepared
    await Timer(int(SPI_CLK_PERIOD/2), "ns")

    io_in_prepared = set_bit(io_in_prepared, SPI_MCLK)
    dut.uio_in.value = io_in_prepared
    await Timer(int(SPI_CLK_PERIOD/2), "ns")

  await ClockCycles(dut.clk, SPI_SYNC_STAGES+1)

  for bit in range(7,-1, -1):

    io_in_prepared = clear_bit(io_in_prepared, SPI_MCLK)
    dut.uio_in.value = io_in_prepared
    await Timer(int(SPI_CLK_PERIOD/2), "ns")
    read_data = read_data | get_bit(dut.uio_out.value, SPI_MISO)
    if bit != 0:
      read_data = read_data << 1;

    io_in_prepared = set_bit(io_in_prepared, SPI_MCLK)
    dut.uio_in.value = io_in_prepared
    await Timer(int(SPI_CLK_PERIOD/2), "ns")
    


  await ClockCycles(dut.clk, SPI_SYNC_STAGES+1)
  io_in_prepared = (1 << SPI_MCLK) | (1 << SPI_MSEL)
  dut.uio_in.value = io_in_prepared;
  await RisingEdge(dut.clk)

  return read_data
