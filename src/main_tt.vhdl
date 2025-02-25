library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.data_types.all;

entity tt_um_sergejsumnovs_spi_slave is
  port (
    ui_in   : in  slv(7 downto 0);
    uo_out  : out slv(7 downto 0);
    uio_in  : in  slv(7 downto 0);
    uio_out : out slv(7 downto 0);
    uio_oe  : out slv(7 downto 0);
    ena     : in sl;
    clk     : in sl;
    rst_n   : in sl
  );
end entity;



architecture RTL of tt_um_sergejsumnovs_spi_slave is
  constant SPI_WORD_COUNT         : natural := 1;
  constant SPI_WORD_LENGTH        : natural := 8;
  constant SPI_SYMBOL_LENGTH      : natural := 1;
  constant SPI_SYNC_STAGES        : natural := 2;

  constant REG_WIDTH              : natural := 8;

  constant TIMER_WIDTH            : natural := 8;
  constant TIMER_PRESCALER_WIDTH  : natural := 8;
  constant TIMER_PWM_COUNT        : natural := 4;
  constant TIMER_CAPTURE_COUNT    : natural := 8;
  constant TIMER_CAPT_SYNC_STAGES : natural := 2;

  constant GPIO_DATA_WIDTH        : natural := 4;
  constant GPIO_SYNC_STAGES       : natural := 2;

  constant LFSR_WIDTH             : natural := 8;

  signal i_mclk : sl := '0';
  signal i_mosi : slv(SPI_SYMBOL_LENGTH-1 downto 0) := (others => '0');
  signal o_miso : slv(SPI_SYMBOL_LENGTH-1 downto 0) := (others => '0');
  signal i_msel : sl := '0';

  signal o_pwm : slv(TIMER_PWM_COUNT-1 downto 0) := (others => '0');
  signal i_capture : slv(TIMER_CAPTURE_COUNT-1 downto 0) := (others => '0');

  signal i_gpi : slv(GPIO_DATA_WIDTH-1 downto 0) := (others => '0');
  signal o_gpo : slv(GPIO_DATA_WIDTH-1 downto 0) := (others => '0');
  signal o_out_en : slv(GPIO_DATA_WIDTH-1 downto 0) := (others => '0');

  signal o_lfsr_high : sl := '0';

begin
  COMP: entity work.tt_system
    generic map (
      SPI_WORD_COUNT => SPI_WORD_COUNT,
      SPI_WORD_LENGTH => SPI_WORD_LENGTH,
      SPI_SYMBOL_LENGTH => SPI_SYMBOL_LENGTH,
      SPI_SYNC_WIDTH => SPI_SYNC_STAGES,

      REG_WIDTH => REG_WIDTH,

      TIMER_WIDTH => TIMER_WIDTH,
      TIMER_PRESCALER_WIDTH => TIMER_PRESCALER_WIDTH,
      TIMER_PWM_COUNT => TIMER_PWM_COUNT,
      TIMER_CAPTURE_COUNT => TIMER_CAPTURE_COUNT,
      TIMER_CAPT_SYNC_STAGES => TIMER_CAPT_SYNC_STAGES,

      GPIO_DATA_WIDTH => GPIO_DATA_WIDTH,
      GPIO_SYNC_STAGES => GPIO_SYNC_STAGES,

      LFSR_WIDTH => LFSR_WIDTH

    )
    port map (
      clk => clk,
      arst => not rst_n,

      i_mclk => i_mclk,
      i_mosi => i_mosi,
      o_miso => o_miso,
      i_msel => i_msel,

      o_pwm => o_pwm,
      i_capture => i_capture,

      i_gpi => i_gpi,
      o_gpo => o_gpo,
      o_out_en => o_out_en,

      o_lfsr_high => o_lfsr_high
    );

  i_capture <= ui_in;
  
  uo_out(0) <= o_pwm(0);
  uo_out(1) <= o_pwm(1);
  uo_out(2) <= o_pwm(2);
  uo_out(3) <= o_pwm(3);
  uo_out(4) <= o_lfsr_high;
  uo_out(5) <= '0';
  uo_out(6) <= '0';
  uo_out(7) <= '0';

  uio_oe(0) <= '0';
  uio_oe(1) <= '0';
  uio_oe(2) <= '1';
  uio_oe(3) <= '0';
  uio_oe(4) <= o_out_en(0);
  uio_oe(5) <= o_out_en(1);
  uio_oe(6) <= o_out_en(2);
  uio_oe(7) <= o_out_en(3);

  i_msel    <= uio_in(0);
  i_mosi(0) <= uio_in(1);
             --uio_in(2) unused
  i_mclk    <= uio_in(3);
  i_gpi(0)  <= uio_in(4);
  i_gpi(1)  <= uio_in(5);
  i_gpi(2)  <= uio_in(6);
  i_gpi(3)  <= uio_in(7);
  
  uio_out(0) <= '0';
  uio_out(1) <= '0';
  uio_out(2) <= o_miso(0);
  uio_out(3) <= '0';
  uio_out(4) <= o_gpo(0);
  uio_out(5) <= o_gpo(1);
  uio_out(6) <= o_gpo(2);
  uio_out(7) <= o_gpo(3);

end architecture;

