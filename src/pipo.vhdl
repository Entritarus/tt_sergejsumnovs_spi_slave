---------------------------------------------------------------------------
--! @file pipo.vhd
--! @author Sergejs Umnovs
---------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


use work.data_types.all;
use work.functions.all;
use work.operators.all;

--! @brief A shift register with parallel input and output. 
--! The parallel I/O port is a bit word array (aslv) port, which is an array of words.
--! The serial I/O port is a bit vector (slv) port.
--! You can load parallel data by asserting i_load while en is also asserted.
--! Each word consists of an integer number of symbols.
--! Parallel data is split into symbols and transmitted by the serial port, that's why it's not just a single bit.
--! Example:
--!   A nibble (4 bits) is one of two symbols of a byte (8 bits).
--! The symbols are transmitted in order from most significant to least significant.
--! The words that are then reconstructed from symbols are stored in little endian format.
--! Word length, count and symbol width, as well as symbol count in a single word and total symbol count is deduced from signal lengths.


entity pipo is
  port(
    clk : in sl;
    rst : in sl;
    en : in sl;

    i_load : in sl;

    i_data : in aslv;
    o_data : out aslv;

    i_sdata : in slv;
    o_sdata : out slv
  );
end entity;

architecture RTL of pipo is

  
  constant WORD_COUNT : natural := i_data'length;
  constant WORD_LENGTH : natural := i_data(0)'length;
  constant SYMBOL_LENGTH : natural := i_sdata'length;
  constant SYMBOL_COUNT_IN_WORD : natural := WORD_LENGTH / SYMBOL_LENGTH; -- symbol count in a single word
  constant TOTAL_SYMBOL_COUNT : natural := WORD_COUNT * SYMBOL_COUNT_IN_WORD;

  signal data_reg, data_next : aslv(0 to TOTAL_SYMBOL_COUNT-1)(SYMBOL_LENGTH-1 downto 0) := (others => (others => '0'));

  signal idata_deconstructed : aslv(data_reg'range)(data_reg(0)'range) := (others => (others => '0'));
  signal odata_reconstructed : aslv(o_data'range)(o_data(0)'range) := (others => (others => '0'));
begin
  -- reg-state logic
  process(clk, rst)
  begin
    if rst = '1' then
      data_reg <= (others => (others => '0'));
    elsif rising_edge(clk) then
      if en = '1' then
        data_reg <= data_next;
      end if;
    end if;
  end process;

  -- next-state logic

  -- deconstruct data
  process (i_data) is
    variable symbol_high : natural := 0;
    variable symbol_low : natural := 0;
  begin
    for i in 0 to WORD_COUNT-1 loop
      for j in 0 to SYMBOL_COUNT_IN_WORD-1 loop
        symbol_low  := j*SYMBOL_LENGTH;
        symbol_high := (j+1)*SYMBOL_LENGTH - 1;
        idata_deconstructed(i*SYMBOL_COUNT_IN_WORD + j) <= i_data(i)(symbol_high downto symbol_low);
      end loop;
    end loop;
  end process;

  process(all) is
  begin
    if i_load = '1' then
      for i in 0 to TOTAL_SYMBOL_COUNT-1 loop
        data_next(i) <= idata_deconstructed(i);
      end loop;
    else
      data_next(data_reg'low) <= i_sdata;
      for i in 1 to TOTAL_SYMBOL_COUNT-1 loop
        data_next(i) <= data_reg(i-1);
      end loop;
    end if;
  end process;

  -- reconstruct data
  process (data_reg) is
    variable symbol_high : natural := 0;
    variable symbol_low : natural := 0;
  begin
    for i in 0 to WORD_COUNT-1 loop
      for j in 0 to SYMBOL_COUNT_IN_WORD-1 loop
        symbol_low  := j*SYMBOL_LENGTH;
        symbol_high := (j+1)*SYMBOL_LENGTH - 1;
        odata_reconstructed(i)(symbol_high downto symbol_low) <= data_reg(i*SYMBOL_COUNT_IN_WORD + j);
      end loop;
    end loop;
  end process;

  -- outputs
  o_data <= odata_reconstructed;
  o_sdata <= data_reg(data_reg'high);

end architecture;
