library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_component is
  port (
    clk : in std_logic;
    rst : in std_logic;
    o_ctr : out std_logic_vector(7 downto 0)
  );
end entity;

architecture RTL of test_component is
  signal ctr_reg, ctr_next : std_logic_vector(o_ctr'range) := (others => '0');
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

  o_ctr <= ctr_reg;

end architecture;
