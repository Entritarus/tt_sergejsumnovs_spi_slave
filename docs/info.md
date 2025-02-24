## How it works

This projects consists of an SPI slave and other components. The SPI slave
accepts an 8-bit address and an 8-bit data value. Write transactions always
have bit 7 of the address set.  Write transactions always have bit 7 of the
address cleared.  There should be a pause between address and data transactions
of at least 3 system clock cycles.  The project includes a register map of 21
registers, GPIO module, LFSR with serial output, timer module with PWM and
capture on rising and falling edges.

Example:

Read transaction. Read data from timer capture register 1.
```
|00001111|pause|11101001|
 address          data
```

Write transaction. Enable PWM and start the timer.
```
|10000001|pause|00000101|
 address          data
```



## How to test

### Simulation

This project uses cocotb and Icarus Verilog. Even though it is a VHDL project,
it was transpiled using GHDL, so you can use Verilog simulation tools.

### Register map

| Address | Description           |
|---------|-----------------------|
| 0x00    | Timer control         |
| 0x01    | Timer top             |
| 0x02    | Timer clock divisor   |
| 0x03    | Timer capture control |
| 0x04    | GPIO read data        |
| 0x05    | GPIO write data       |
| 0x06    | GPIO direction        |
| 0x07    | LFSR polynome         |
| 0x08    | LFSR control          |
| 0x09    | LFSR state input      |
| 0x0a    | PWM 0 top             |
| 0x0b    | PWM 1 top             |
| 0x0c    | PWM 2 top             |
| 0x0d    | PWM 3 top             |
| 0x0e    | Capture 0 register    |
| 0x0f    | Capture 1 register    |
| 0x10    | Capture 2 register    |
| 0x11    | Capture 3 register    |
| 0x12    | Capture 4 register    |
| 0x13    | Capture 5 register    |
| 0x14    | Capture 6 register    |
| 0x15    | Capture 7 register    |

### Description of each register

#### Timer control (0x00)        
| 0x01    | Timer top             |
| 0x02    | Timer clock divisor   |
| 0x03    | Timer capture control |
| 0x04    | GPIO read data        |
| 0x05    | GPIO write data       |
| 0x06    | GPIO direction        |
| 0x07    | LFSR polynome         |
| 0x08    | LFSR control          |
| 0x09    | LFSR state input      |
| 0x0a    | PWM 0 top             |
| 0x0b    | PWM 1 top             |
| 0x0c    | PWM 2 top             |
| 0x0d    | PWM 3 top             |
| 0x0e    | Capture 0 register    |
| 0x0f    | Capture 1 register    |
| 0x10    | Capture 2 register    |
| 0x11    | Capture 3 register    |
| 0x12    | Capture 4 register    |
| 0x13    | Capture 5 register    |
| 0x14    | Capture 6 register    |
| 0x15    | Capture 7 register    |


## External hardware
A USB-to-SPI adapter, a couple of LEDs...
