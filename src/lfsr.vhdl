-------------------------------------------------------------------------------
--! @file lfsr.vhd
--! @author Sergejs Umnovs
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;


use work.data_types.all;
use work.functions.all;

--! @brief Linear Feeback Shift Register is a component frequently used to
--!        generate pseudo-random numbers for use in cryptography, noise signal
--!        generation, etc. The LFSR is a shift register with a feedback
--!        circuit that consists of XOR elements. There are two types of LFSR
--!        architectures: Fibonacci and Galois.
--!
--!        In LFSRs with Galois architecture XOR elements are placed between
--!        FFs, like in CRC shift registers.
--!
--!        An LFSR with Fibonacci architecture is a just a shift register with
--!        its input connected to a feedback network of many XORs.
--!
--!        This implementation is a Galois LFSR
--!        For an LFSR to be maximal length, the polynomial must be:
--!          1. Irreducible
--!          2. Primitive
--!        More info on LFSRs here:
--!          https://en.wikipedia.org/wiki/Linear-feedback_shift_register
--!          http://koclab.cs.ucsb.edu/teaching/ccs130h/2016/03c-lfsr.pdf
--!
entity lfsr is
  port(
    clk : in sl;        --! system clock
    rst : in sl;        --! system reset

    i_poly : in slv;    --! input polynome coefficients for x^m, for m in 0 to n-1
    i_en   : in sl;     --! enable signal
    
    i_serial : in sl;   --! serial data input (optional, you may set it to '0')
    o_serial : out sl;  --! serial data output

    i_load : in sl;     --! signal to enable loading to the shift register
    i_data : in slv;    --! initial state input
    o_data : out slv    --! stat output
  );
end entity;

architecture RTL of lfsr is
  constant DATA_WIDTH : natural := i_data'length;
  signal shift_reg, shift_next : slv(DATA_WIDTH-1 downto 0) := (others => '0');
begin
  -- reg-state logic
  process(clk, rst)
  begin
    if rst = '1' then
      shift_reg <= (others => '0');
    elsif rising_edge(clk) then
      if i_en = '1' then
        shift_reg <= shift_next;
      end if;
    end if;
  end process;
  
  shift_next(0) <= i_data(0) when i_load = '1' else
                   shift_reg(shift_reg'high) xor i_serial when i_poly(0) = '1' else
                   i_serial;
  XORS: for i in 1 to DATA_WIDTH-1 generate
    shift_next(i) <= i_data(i) when i_load = '1' else
                     shift_reg(shift_reg'high) xor shift_reg(i-1) when i_poly(i) = '1' else
                     shift_reg(i-1);
  end generate;

  o_serial <= shift_reg(shift_reg'high);
  o_data <= shift_reg;

end architecture;
