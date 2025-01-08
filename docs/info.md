<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This projects consists of an SPI slave and other components. The SPI slave accepts an 8-bit address and an 8-bit data value (need to clarify bit count).
The project includes a register map of (register count) registers, GPIO module, timer module with PWM (maybe also add CRC, LFSR, adder).

Example:
```
|00100110|11101001|
 address    data
```

<!--- Explain how your project works -->

## How to test

### Simulation
To simulate this project, you will need [VUnit](https://vunit.github.io/).

Just run `run.py`, and the tests will happen.

<!--- Explain how to use your project -->

## External hardware

An FTDI USB-to-SPI adapter, a couple of LEDs...

<!--- List external hardware used in your project (e.g. PMOD, LED display, etc), if any -->
