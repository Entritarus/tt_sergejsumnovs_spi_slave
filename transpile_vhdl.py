'''
  This script transpiles VHDL files into a Verilog netlist
'''

import json
import subprocess
import shutil
import re
import os
import os.path

vhdl_files = [
  "src/data_types.vhdl",
  "src/functions.vhdl",
  "src/gpio_separate.vhdl",
  "src/lfsr.vhdl",
  "src/main_tt.vhdl",
  "src/main.v",
  "src/operators.vhdl",
  "src/pipo.vhdl",
  "src/procedures.vhdl",
  "src/spi_slave.vhdl",
  "src/timer_counter_pwm_pkg.vhdl",
  "src/timer_counter_pwm.vhdl",
  "src/tt_system_pkg.vhdl",
  "src/tt_system.vhdl"
]

# transpile files to Verilog
input_files_str = ''
for f in vhdl_files:
  input_files_str += f + ' '

subprocess.run(f'ghdl synth -Wno-binding --std=08 --out=verilog {input_files_str} -e > src/main.v', shell = True)
