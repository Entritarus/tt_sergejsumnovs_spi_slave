library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.data_types.all;

library work;

entity counter is
  port (
    clk : in sl;
    rst : in sl;
    o_ctr : out slv(7 downto 0)
  );
end entity;

architecture RTL of counter is
  signal ctr_reg, ctr_next : unsigned(o_ctr'range) := (others => '0');
begin
  process(clk, rst) is
  begin
    if rst = '0' then
      ctr_reg <= (others => '0');
    else
      if rising_edge(clk) then
        ctr_reg <= ctr_next;
      end if;
    end if;
  end process;

  ctr_next <= ctr_reg + 1;

  o_ctr <= std_logic_vector(ctr_reg);

end architecture;
