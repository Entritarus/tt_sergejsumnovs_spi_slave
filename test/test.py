# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, Timer, RisingEdge

from constants import *
from bit_operations import *
from test_procedures import *
from spi_tb_functions import *


@cocotb.test()
async def test_project(dut):
  dut._log.info("Start")

  clock = Clock(dut.clk, CLK_PERIOD, units="ns")
  cocotb.start_soon(clock.start())

  await dut_reset(dut)

  await test_gpio(dut)
  await test_lfsr(dut)
  await test_pwm(dut)
  await test_capture(dut)
