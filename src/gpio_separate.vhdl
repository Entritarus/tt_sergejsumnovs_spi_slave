---------------------------------------------------------------------------
--! @file gpio_separate.vhd
--! @author Sergejs Umnovs
---------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;


use work.data_types.all;
use work.functions.all;

--! @brief General Purpose Input/Output with Separated Input and Output Lines
--!
--! @param This component is very similar to GPIO, but this one uses separate input and output
--!        ports because some systems may not have integrated tri-state buffers

entity gpio_separate is
  generic (
    SYNC_STAGES : natural := 1
  );
  port(
    clk : in sl;
    rst : in sl;

    i_dir : in slv;
    i_wdata : in slv;
    o_rdata : out slv;

    i_gpi : in slv;
    o_gpo : out slv;
    o_out_en : out slv
  );
end entity;

architecture RTL of gpio_separate is
  constant DATA_WIDTH : natural := i_dir'length;
  constant TRI_STATE_VECTOR : slv(DATA_WIDTH-1 downto 0) := (others => 'Z');
  signal sync_next, sync_reg : aslv(0 to SYNC_STAGES-1)(DATA_WIDTH-1 downto 0) := (others => (others => '0'));
  signal data_reg, data_next : slv(DATA_WIDTH-1 downto 0) := (others => '0');
  signal sync_output : slv(DATA_WIDTH-1 downto 0) := (others => '0');

begin
  -- reg-state logic
  process(clk, rst)
  begin
    if rst = '1' then
      sync_reg <= (others => (others => '0'));
      data_reg <= (others => '0');
    elsif rising_edge(clk) then
      sync_reg <= sync_next;
      data_reg <= data_next;
    end if;
  end process;

  -- next-state logic
  GEN_NO_SYNC: if SYNC_STAGES = 0 generate
    sync_output <= i_gpi;
  end generate;

  GEN_SYNC: if SYNC_STAGES > 0 generate
    sync_next(0) <= i_gpi;
    GEN_SYNC_SHIFT: if SYNC_STAGES > 1 generate
      sync_next(1 to SYNC_STAGES-1) <= sync_reg(0 to SYNC_STAGES-2);
    end generate;

    sync_output <= sync_reg(sync_reg'high);
  end generate;

  GEN_INDIVIDUAL_DIR: for i in DATA_WIDTH-1 downto 0 generate
    data_next(i) <= sync_output(i) when i_dir(i) = '0' else
                    i_wdata(i);
  end generate;

  -- outputs
  o_rdata <= data_reg;

  o_gpo <= data_reg;

  o_out_en <= i_dir;

end architecture;
