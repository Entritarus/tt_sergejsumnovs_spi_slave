library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.data_types.all;

entity tt_um_sergejsumnovs_spi_slave is
  port (
    ui_in   : in  std_logic_vector(7 downto 0);
    uo_out  : out std_logic_vector(7 downto 0);
    uio_in  : in  std_logic_vector(7 downto 0);
    uio_out : out std_logic_vector(7 downto 0);
    uio_oe  : out std_logic_vector(7 downto 0);
    ena     : in  std_logic;
    clk     : in  std_logic;
    rst_n   : in  std_logic
  );
end entity;

architecture RTL of tt_um_sergejsumnovs_spi_slave is
  signal ctr_reg, ctr_next : unsigned(7 downto 0) := (others => '0');
begin
  process(clk, rst_n) is
  begin
    if rst_n = '0' then
      ctr_reg <= (others => '0');
    else
      if rising_edge(clk) then
        ctr_reg <= ctr_next;
      end if;
    end if;
  end process;

  ctr_next <= ctr_reg + 1;

  uo_out <= std_logic_vector(ctr_reg);

  -- for some reason work library does not exist
  --TEST_COMPONENT: entity work.counter
  --  port map (
  --    clk => clk,
  --    rst => rst_n,
  --    o_ctr => uio_out
  --  );
  
  uio_out <= (others => '0');
  uio_oe <= (others => '0');
end architecture;
