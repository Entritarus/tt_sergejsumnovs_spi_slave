---------------------------------------------------------------------------
--! @file tt_system.vhd
--! @author Sergejs Umnovs
---------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


use work.data_types.all;
use work.functions.all;
use work.tt_system_pkg.all;


use work.procedures.all;
use work.timer_counter_pwm_pkg.all;



--! @brief The top level component for Tiny Tapeout
--!
--! @param SPI_WORD_COUNT         Word count of a generic SPI slave component, must be equal to 1
--! @param SPI_WORD_LENGTH        Word length of a generic SPI slave component, must be equal to REG_WIDTH
--! @param SPI_SYMBOL_LENGTH      Symbol length of a generic SPI slave component, must be equal to 1 (MOSI/MISO width)
--! @param SPI_SYNC_WIDTH         o_valid sync width from SPI slave 
--!
--! @param REG_WIDTH              Regmap register width
--!
--! @param TIMER_WIDTH Timer      counter width, must be equal to REG_WIDTH
--! @param TIMER_PRESCALER_WIDTH  Timer clock prescaling width, must be equal to REG_WIDTH
--! @param TIMER_PWM_COUNT        Timer PWM signal count
--! @param TIMER_CAPTURE_COUNT    Timer capture count
--! @param TIMER_CAPT_SYNC_STAGES Timer capture signal sync stage count
--!
--! @param GPIO_DATA_WIDTH        GPIO line count
--! @param GPIO_SYNC_STAGES       GPIO input sync stage count
--!
--! @param LFSR_WIDTH             LFSR shift register width

entity tt_system is
  generic(
    -- SPI Slave related generics
    SPI_WORD_COUNT          : natural := 1;
    SPI_WORD_LENGTH         : natural := 8;
    SPI_SYMBOL_LENGTH       : natural := 1;
    SPI_SYNC_WIDTH          : natural := 2;

    -- Regmap related generics
    REG_WIDTH               : natural := 8;

    -- Timer related generics
    TIMER_WIDTH             : natural := 8;
    TIMER_PRESCALER_WIDTH   : natural := 8;
    TIMER_PWM_COUNT         : natural := 4;
    TIMER_CAPTURE_COUNT     : natural := 8;
    TIMER_CAPT_SYNC_STAGES  : natural := 2;

    -- GPIO related generics 
    GPIO_DATA_WIDTH         : natural := 8;
    GPIO_SYNC_STAGES        : natural := 2;

    -- LFSR related generics
    LFSR_WIDTH              : natural := 8

  );
  port(
    clk         : in sl;
    arst        : in sl;

    -- SPI slave related ports
    i_mclk      : in sl;
    i_mosi      : in slv;
    o_miso      : out slv;
    i_msel      : in sl;

    -- Timer related ports
    o_pwm       : out slv;
    i_capture   : in slv;

    -- GPIO related ports
    i_gpi : in slv;
    o_gpo : out slv;
    o_out_en : out slv;

    -- LFSR related ports
    o_lfsr_high : out sl
  );
end entity;

architecture RTL of tt_system is
  constant SPI_SYMBOL_COUNT_IN_WORD : natural := SPI_WORD_LENGTH / SPI_SYMBOL_LENGTH;
  constant SPI_TOTAL_SYMBOL_COUNT   : natural := SPI_WORD_COUNT * SPI_SYMBOL_COUNT_IN_WORD;
  constant SPI_FLAT_DATA_WIDTH      : natural := SPI_WORD_COUNT * SPI_WORD_LENGTH;

  constant REG_COUNT : natural := RM_SINGLE_REG_COUNT + TIMER_PWM_COUNT + TIMER_CAPTURE_COUNT;

  -- SPI Slave related signals
  signal spi_i_load : sl := '0';
  signal spi_i_data : aslv(0 to SPI_WORD_COUNT-1)(SPI_WORD_LENGTH-1 downto 0) := (others => (others => '0'));
  signal spi_o_ready : sl := '0';

  signal spi_o_valid : sl := '0';
  signal spi_o_valid_sync_reg, spi_o_valid_sync_next  : slv (SPI_SYNC_WIDTH-1 downto 0) := (others => '0');
  signal spi_o_valid_synced : sl := '0';
  signal spi_o_valid_reg, spi_o_valid_next : sl := '0';
  signal spi_o_valid_rising : sl := '0';
  signal spi_o_data : aslv(0 to SPI_WORD_COUNT-1)(SPI_WORD_LENGTH-1 downto 0) := (others => (others => '0'));
  signal spi_o_data_slv : slv(SPI_FLAT_DATA_WIDTH-1 downto 0) := (others => '0');

  -- Interconnect related signals

  signal ic_address_reg, ic_address_next : slv(SPI_FLAT_DATA_WIDTH-1 downto 0) := (others => '0');
  signal ic_address_en : sl := '0';
  signal ic_address_reg_nat : natural := 0;
  signal ic_addr_loaded_reg, ic_addr_loaded_next : sl := '0';
  signal ic_access_mode_reg, ic_access_mode_next : sl := '0';

  -- Regmap related signals

  signal regmap_reg, regmap_next : aslv(0 to REG_COUNT-1)(REG_WIDTH-1 downto 0) := (others => (others => '0'));
  signal regmap_en : slv (REG_COUNT-1 downto 0) := (others => '0');
  signal regmap_en_demuxed : slv (REG_COUNT-1 downto 0) := (others => '0');
  signal regmap_en_cond : sl := '0';
  signal regmap_rdata : slv(REG_WIDTH-1 downto 0) := (others => '0');

  -- Timer related signals
  signal timer_i_ctl : timer_ctl_t;

  signal timer_i_top : slv(TIMER_WIDTH-1 downto 0) := (others => '0');
  signal timer_i_clk_divisor : slv(TIMER_PRESCALER_WIDTH-1 downto 0) := (others => '0');
  signal timer_o_timer : slv(TIMER_WIDTH-1 downto 0) := (others => '0');

  signal timer_i_pwm_tops : aslv(0 to TIMER_PWM_COUNT-1)(TIMER_WIDTH-1 downto 0) := (others => (others => '0'));
  signal timer_i_capt_ctl : slv(TIMER_CAPTURE_COUNT-1 downto 0) := (others => '0');
  signal timer_i_capture : slv(TIMER_CAPTURE_COUNT-1 downto 0) := (others => '0');
  signal timer_o_capture_valid : sl := '0';
  signal timer_o_capture_idx : slv(log2c(TIMER_CAPTURE_COUNT)-1 downto 0) := (others => '0');

  -- GPIO related signals
  signal gpio_i_dir : slv(GPIO_DATA_WIDTH-1 downto 0) := (others => '0');
  signal gpio_i_wdata : slv(GPIO_DATA_WIDTH-1 downto 0) := (others => '0');
  signal gpio_o_rdata : slv(GPIO_DATA_WIDTH-1 downto 0) := (others => '0');

  -- LFSR related signals
  signal lfsr_i_poly : slv(LFSR_WIDTH-1 downto 0) := (others => '0');
  signal lfsr_i_en : sl := '0';

  signal lfsr_i_serial : sl := '0';
  --signal lfsr_o_serial : sl := '0';

  signal lfsr_i_load : sl := '0';
  signal lfsr_i_data : slv(LFSR_WIDTH-1 downto 0) := (others => '0');
  signal lfsr_o_data : slv(LFSR_WIDTH-1 downto 0) := (others => '0');

begin
  -- check if component ports will fit into registers
  assert REG_WIDTH >= SPI_FLAT_DATA_WIDTH   report "SPI parallel output is wider than a register" severity error;
  assert REG_WIDTH >= TIMER_WIDTH           report "Timer is wider than a register"               severity error;
  assert REG_WIDTH >= TIMER_PRESCALER_WIDTH report "Timer prescaler is wider than a register"     severity error;
  assert REG_WIDTH >= LFSR_WIDTH            report "LFSR is wider than a register"                severity error;

  -- reg-state logic
  process(clk, arst)
  begin
    if arst = '1' then
      spi_o_valid_sync_reg  <= (others => '0');
      spi_o_valid_reg       <= '0';
      ic_address_reg        <= (others => '0');
      ic_addr_loaded_reg    <= '0';
      ic_access_mode_reg    <= '0';
      regmap_reg            <= (others => (others => '0'));
    elsif rising_edge(clk) then
      spi_o_valid_sync_reg  <= spi_o_valid_sync_next;
      spi_o_valid_reg       <= spi_o_valid_next;
      ic_addr_loaded_reg    <= ic_addr_loaded_next;
      ic_access_mode_reg    <= ic_access_mode_next;

      if ic_address_en = '1' then
        ic_address_reg      <= ic_address_next;
      end if;
      
      for i in 0 to REG_COUNT-1 loop
        if regmap_en(i) = '1' then
          regmap_reg(i) <= regmap_next(i);
        end if;
      end loop;
    end if;
  end process;

  SPI_SLAVE_INST: entity work.spi_slave
    port map (
      clk     => clk,
      arst    => arst,

      i_mclk  => i_mclk,
      i_mosi  => i_mosi,
      o_miso  => o_miso,
      i_msel  => i_msel,

      i_load  => spi_i_load,
      i_data  => spi_i_data,
      o_ready => spi_o_ready,

      o_valid => spi_o_valid,
      o_data  => spi_o_data
    );

  TIMER_COUNTER_INST: entity work.timer_counter_pwm
    generic map (
      CAPT_SYNC_WIDTH => TIMER_CAPT_SYNC_STAGES
    )
    port map (
      clk             => clk,
      rst             => arst,

      i_ctl           => timer_i_ctl,

      i_top           => timer_i_top,
      i_clk_divisor   => timer_i_clk_divisor,
      o_timer         => timer_o_timer,

      i_pwm_tops      => timer_i_pwm_tops,
      o_pwm           => o_pwm,

      i_capt_ctl      => timer_i_capt_ctl,
      i_capture       => i_capture,
      o_capture_valid => timer_o_capture_valid,
      o_capture_idx   => timer_o_capture_idx
    );

  GPIO_INST: entity work.gpio_separate
    generic map (
      SYNC_STAGES => GPIO_SYNC_STAGES
    )
    port map (
      clk     => clk,
      rst     => arst,

      i_dir   => gpio_i_dir,
      i_wdata => gpio_i_wdata,
      o_rdata => gpio_o_rdata,

      i_gpi => i_gpi,
      o_gpo => o_gpo,
      o_out_en => o_out_en
    );

  LFSR_INST: entity work.lfsr
    port map (
      clk      => clk,
      rst      => arst,

      i_poly   => lfsr_i_poly,
      i_en     => lfsr_i_en,

      i_serial => lfsr_i_serial,
      o_serial => o_lfsr_high,

      i_load   => lfsr_i_load,
      i_data   => lfsr_i_data,
      o_data   => lfsr_o_data
    );

  -- next-state logic
  -- SPI Slave valid sync
  GEN_NO_O_VALID_SYNC: if SPI_SYNC_WIDTH = 0 generate
    spi_o_valid_synced <= spi_o_valid;
  end generate;

  GEN_SPI_O_VALID_SYNC: if SPI_SYNC_WIDTH > 0 generate
    spi_o_valid_sync_next(0) <= spi_o_valid;
    GEN_SYNC_SHIFT: if SPI_SYNC_WIDTH > 1 generate
      spi_o_valid_sync_next(SPI_SYNC_WIDTH-1 downto 1) <= spi_o_valid_sync_reg(SPI_SYNC_WIDTH-2 downto 0);
    end generate;

    spi_o_valid_synced <= spi_o_valid_sync_reg(spi_o_valid_sync_reg'high);
  end generate;

  spi_o_valid_next <= spi_o_valid_synced;
  spi_o_valid_rising <= spi_o_valid_next and (not spi_o_valid_reg);

  -- SPI Slave connection to regmap

  edi_cast(spi_o_data_slv, spi_o_data);

  ic_address_next(SPI_FLAT_DATA_WIDTH-2 downto 0) <= spi_o_data_slv(SPI_FLAT_DATA_WIDTH-2 downto 0);
  ic_address_en <= not ic_addr_loaded_reg;
  ic_address_reg_nat <= to_integer(unsigned(ic_address_reg)) when ic_addr_loaded_reg = '1' else
                        0;

  ic_addr_loaded_next <= not ic_addr_loaded_reg when spi_o_valid_rising = '1' else
                         ic_addr_loaded_reg;

  ic_access_mode_next <= spi_o_data_slv(spi_o_data_slv'high) when ic_addr_loaded_reg = '0' else
                         ic_access_mode_reg;

  ---- write logic

  ---- regmap_next and regmap_en is treated in a special way for each register since not all components just read from a register
  regmap_en_cond <= ic_addr_loaded_reg and ic_access_mode_reg and spi_o_valid_rising;

  ---- read logic
  regmap_rdata <= regmap_reg(ic_address_reg_nat);
  edi_cast(spi_i_data, regmap_rdata);
  spi_i_load <= spi_o_ready when ic_addr_loaded_reg = '1' and ic_access_mode_reg = '0' else
                '0';

  -- component connection to regmap
  -- most of the components only read from registers, except GPIO, which can read and write
  -- timer capture can write to regmap

  ---- regmap_next connections
  regmap_next(RM_TIMER_CTL) <= spi_o_data_slv;
  regmap_next(RM_TIMER_TOP) <= spi_o_data_slv;
  regmap_next(RM_TIMER_CLK_DIV) <= spi_o_data_slv;
  regmap_next(RM_TIMER_CAPT_CTL) <= spi_o_data_slv;
  regmap_next(RM_GPIO_RDATA)(gpio_o_rdata'range) <= gpio_o_rdata;
  regmap_next(RM_GPIO_WDATA) <= spi_o_data_slv;
  regmap_next(RM_GPIO_DIR) <= spi_o_data_slv;
  regmap_next(RM_LFSR_POLY) <= spi_o_data_slv;
  regmap_next(RM_LFSR_CTL) <= spi_o_data_slv;
  regmap_next(RM_LFSR_IDATA) <= spi_o_data_slv;
  GEN_RM_NEXTS_FOR_PWM_TOPS: for i in 0 to TIMER_PWM_COUNT-1 generate
    regmap_next(RM_SINGLE_REG_COUNT + i) <= spi_o_data_slv;
  end generate;
  GEN_RM_NEXTS_FOR_CAPTURES: for i in 0 to TIMER_CAPTURE_COUNT-1 generate
    regmap_next(RM_SINGLE_REG_COUNT + TIMER_PWM_COUNT + i) <= timer_o_timer;
  end generate;

  
  ---- regmap enable signal demux
  REGMAP_EN_DEMUX_PROC: process(all) is
  begin
    regmap_en_demuxed <= (others => '0');
    for i in 0 to REG_COUNT-1 loop
      if to_integer(unsigned(ic_address_reg)) = i then
        regmap_en_demuxed(i) <= regmap_en_cond;
      end if;
    end loop;
    
  end process;

  ---- regmap_en connections

  regmap_en(RM_TIMER_CTL) <= regmap_en_demuxed(RM_TIMER_CTL);
  regmap_en(RM_TIMER_TOP) <= regmap_en_demuxed(RM_TIMER_TOP);
  regmap_en(RM_TIMER_CLK_DIV) <= regmap_en_demuxed(RM_TIMER_CLK_DIV);
  regmap_en(RM_TIMER_CAPT_CTL) <= regmap_en_demuxed(RM_TIMER_CAPT_CTL);
  regmap_en(RM_GPIO_RDATA) <= '1';
  regmap_en(RM_GPIO_WDATA) <= regmap_en_demuxed(RM_GPIO_WDATA);
  regmap_en(RM_GPIO_DIR) <= regmap_en_demuxed(RM_GPIO_DIR);
  regmap_en(RM_LFSR_POLY) <= regmap_en_demuxed(RM_LFSR_POLY);
  regmap_en(RM_LFSR_CTL) <= regmap_en_demuxed(RM_LFSR_CTL);
  regmap_en(RM_LFSR_IDATA) <= regmap_en_demuxed(RM_LFSR_IDATA);
  
  GEN_ENABLES_FOR_PWM_TOPS: for i in 0 to TIMER_PWM_COUNT-1 generate
    regmap_en(RM_SINGLE_REG_COUNT + i) <= regmap_en_demuxed(RM_SINGLE_REG_COUNT + i);
  end generate;

  GEN_ENABLES_FOR_CAPTURES: for i in 0 to TIMER_CAPTURE_COUNT-1 generate
    regmap_en(RM_SINGLE_REG_COUNT + TIMER_PWM_COUNT + i) <= timer_o_capture_valid when to_integer(unsigned(timer_o_capture_idx)) = i else
                                                            '0';
  end generate;

  ---- timer
  timer_i_ctl.ctr_en <= regmap_reg(RM_TIMER_CTL)(TIMER_EN);
  timer_i_ctl.ctr_up_down <= regmap_reg(RM_TIMER_CTL)(TIMER_UP_DOWN);
  timer_i_ctl.ctr_en_pwm <= regmap_reg(RM_TIMER_CTL)(TIMER_EN_PWM);
  timer_i_ctl.ctr_en_capt <= regmap_reg(RM_TIMER_CTL)(TIMER_EN_CAPT);
  timer_i_ctl.ctr_rst_on_top <= regmap_reg(RM_TIMER_CTL)(TIMER_RST_ON_TOP);

  timer_i_top <= regmap_reg(RM_TIMER_TOP);
  timer_i_clk_divisor <= regmap_reg(RM_TIMER_CLK_DIV);
  timer_i_capt_ctl <= regmap_reg(RM_TIMER_CAPT_CTL)(timer_i_capt_ctl'range);
  GEN_TIMER_PWM_TOPS: for i in 0 to TIMER_PWM_COUNT-1 generate
    timer_i_pwm_tops(i) <= regmap_reg(RM_SINGLE_REG_COUNT + i);
  end generate;


  ---- GPIO
  gpio_i_wdata <= regmap_reg(RM_GPIO_WDATA)(gpio_i_wdata'range);
  gpio_i_dir <= regmap_reg(RM_GPIO_DIR)(gpio_i_dir'range);


  ---- LFSR
  lfsr_i_poly <= regmap_reg(RM_LFSR_POLY);
  lfsr_i_en   <= regmap_reg(RM_LFSR_CTL)(LFSR_EN);
  lfsr_i_load <= regmap_reg(RM_LFSR_CTL)(LFSR_LOAD);
  lfsr_i_data <= regmap_reg(RM_LFSR_IDATA);
  lfsr_i_serial <= '0';

end architecture;
