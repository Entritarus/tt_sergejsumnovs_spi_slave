-------------------------------------------------------
--! @file procedures.vhd
--! @author Sergejs Umnovs
--!
--! @brief Package with SPI bit, symbol and word reversal
-------------------------------------------------------

library ieee;


use ieee.std_logic_1164.all;
use work.data_types.all;


package procedures is
  procedure spi_rev_bits_var(
    par_data_out : out aslv;
    par_data_in : in aslv;
    word_count : in natural;
    word_len : in natural;
    sym_len : in natural
  );
  procedure spi_rev_syms_var(
    par_data_out : out aslv;
    par_data_in : in aslv;
    word_count : in natural;
    word_len : in natural;
    sym_len : in natural
  );
  procedure spi_rev_words_var(
    par_data_out : out aslv;
    par_data_in : in aslv
  );
  procedure spi_rev_bits(
    signal par_data_out : out aslv;
    signal par_data_in : in aslv;
    word_count : in natural;
    word_len : in natural;
    sym_len : in natural
  );
  procedure spi_rev_syms(
    signal par_data_out : out aslv;
    signal par_data_in : in aslv;
    word_count : in natural;
    word_len : in natural;
    sym_len : in natural
  );
  procedure spi_rev_words(
    signal par_data_out : out aslv;
    signal par_data_in : in aslv
  );


end package;

package body procedures is
  procedure spi_rev_bits_var(
    par_data_out : out aslv;
    par_data_in : in aslv;
    word_count : in natural;
    word_len : in natural;
    sym_len : in natural
  ) is
    constant SYMBOL_COUNT_IN_WORD : natural := word_len / sym_len;
    constant TOTAL_SYMBOL_COUNT : natural := word_count * SYMBOL_COUNT_IN_WORD;
  begin
    for i in 0 to word_count-1 loop
      for j in 0 to SYMBOL_COUNT_IN_WORD-1 loop
        for k in 0 to sym_len-1 loop
          par_data_out(i)(j*sym_len + k) := par_data_in(i)(j*sym_len + (sym_len-k-1));
        end loop;
      end loop;
    end loop;
  end procedure;

  procedure spi_rev_syms_var(
    par_data_out : out aslv;
    par_data_in : in aslv;
    word_count : in natural;
    word_len : in natural;
    sym_len : in natural
  ) is
    constant SYMBOL_COUNT_IN_WORD : natural := word_len / sym_len;
    constant TOTAL_SYMBOL_COUNT : natural := word_count * SYMBOL_COUNT_IN_WORD;
  begin
    for i in 0 to word_count-1 loop
      for j in 0 to SYMBOL_COUNT_IN_WORD-1 loop
        for k in 0 to sym_len-1 loop
          par_data_out(i)(j*sym_len + k) := par_data_in(i)((SYMBOL_COUNT_IN_WORD-j-1)*sym_len + k);
        end loop;
      end loop;
    end loop;
  end procedure;

  procedure spi_rev_words_var(
    par_data_out : out aslv;
    par_data_in : in aslv
  ) is
    constant WORD_COUNT : natural := par_data_out'length;
  begin
    for i in 0 to par_data_out'length-1 loop
      par_data_out(i) := par_data_in(WORD_COUNT-i-1);
    end loop;
  end procedure;

  procedure spi_rev_bits(
    signal par_data_out : out aslv;
    signal par_data_in : in aslv;
    word_count : in natural;
    word_len : in natural;
    sym_len : in natural
  ) is
    variable par_data_out_v : aslv(par_data_out'range)(par_data_out(0)'range) := (others => (others => '0'));
    variable par_data_in_v : aslv(par_data_in'range)(par_data_in(0)'range) := (others => (others => '0'));
  begin
    par_data_in_v := par_data_in;
    spi_rev_bits_var(par_data_out_v, par_data_in_v, word_count, word_len, sym_len);
    par_data_out <= par_data_out_v;
  end procedure;

  procedure spi_rev_syms(
    signal par_data_out : out aslv;
    signal par_data_in : in aslv;
    word_count : in natural;
    word_len : in natural;
    sym_len : in natural
  ) is 
    variable par_data_out_v : aslv(par_data_out'range)(par_data_out(0)'range) := (others => (others => '0'));
    variable par_data_in_v : aslv(par_data_in'range)(par_data_in(0)'range) := (others => (others => '0'));
  begin
    par_data_in_v := par_data_in;
    spi_rev_syms_var(par_data_out_v, par_data_in_v, word_count, word_len, sym_len);
    par_data_out <= par_data_out_v;
  end procedure;

  procedure spi_rev_words(
    signal par_data_out : out aslv;
    signal par_data_in : in aslv
  ) is 
    variable par_data_out_v : aslv(par_data_out'range)(par_data_out(0)'range) := (others => (others => '0'));
    variable par_data_in_v : aslv(par_data_in'range)(par_data_in(0)'range) := (others => (others => '0'));
  begin
    par_data_in_v := par_data_in;
    spi_rev_words_var(par_data_out_v, par_data_in_v);
    par_data_out <= par_data_out_v;
  end procedure;
  
end package body;
