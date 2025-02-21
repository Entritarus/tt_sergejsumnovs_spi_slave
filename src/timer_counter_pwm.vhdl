---------------------------------------------------------------------------
--! @file timer_counter_pwm.vhd
--! @author Sergejs Umnovs
---------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


use work.data_types.all;
use work.functions.all;


use work.timer_counter_pwm_pkg.all;

--! @brief A timer and counter component with pulse-width modulation and capture registers
--!
--! @param CAPT_SYNC_WIDTH The width of the capture shift register


entity timer_counter_pwm is
  generic (
    CAPT_SYNC_WIDTH : natural := 2
  );
  port(
    clk : in sl;
    rst : in sl;

    i_ctl : in timer_ctl_t;

    i_top : in slv;
    i_clk_divisor : in slv;
    o_timer : out slv;

    i_pwm_tops : in aslv;
    o_pwm : out slv;

    i_capt_ctl : in slv;
    i_capture : in slv;
    o_capture_valid : out sl;
    o_capture_idx : out slv
  );
end entity;

architecture RTL of timer_counter_pwm is
  constant TIMER_WIDTH : natural := o_timer'length;
  constant PRESCALER_WIDTH : natural := i_clk_divisor'length;
  constant PWM_COUNT : natural := o_pwm'length;
  constant CAPTURE_COUNT : natural := i_capture'length;
  signal timer_reg, timer_next : unsigned(TIMER_WIDTH-1 downto 0) := (others => '0');
  signal timer_en : sl := '0';
  signal prescaler_reg, prescaler_next : unsigned(PRESCALER_WIDTH-1 downto 0) := (others => '0');
  signal timer_should_update : boolean := false;

  -- PWM related
  signal turn_on_pwm : slv(PWM_COUNT-1 downto 0) := (others => '0');

  -- Capture related
  signal capt_sync_reg, capt_sync_next : aslv(0 to CAPTURE_COUNT-1)(CAPT_SYNC_WIDTH-1 downto 0) := 
    (others => (others => '0'));
  signal i_capture_synced : slv(CAPTURE_COUNT-1 downto 0) := (others => '0');
  signal capt_reg, capt_next : slv(CAPTURE_COUNT-1 downto 0) := (others => '0');
  signal capt_edge : slv(CAPTURE_COUNT-1 downto 0) := (others => '0');

  signal capt_idx : unsigned(log2c(CAPTURE_COUNT)-1 downto 0) := (others => '0');
  signal capt_valid : sl := '0';

  signal pwm_reg, pwm_next : slv(PWM_COUNT-1 downto 0) := (others => '0');

begin
  -- reg-state logic
  process(clk, rst)
  begin
    if rst = '1' then
      prescaler_reg <= (others => '0');
      timer_reg <= (others => '0');
      capt_sync_reg <= (others => (others => '0'));
      capt_reg <= (others => '0');
      pwm_reg <= (others => '0');
    elsif rising_edge(clk) then

      if timer_en = '1' then
        prescaler_reg <= prescaler_next;
      end if;

      if timer_en = '1' and timer_should_update then
        timer_reg <= timer_next;
      end if;

      capt_sync_reg <= capt_sync_next;
      capt_reg <= capt_next;
      pwm_reg <= pwm_next;

    end if;
  end process;

  -- next-state logic
  -- timer updates
  timer_en <= i_ctl.ctr_en;

  timer_next <= (others => '0') when i_ctl.ctr_rst_on_top = '1' and timer_reg = unsigned(i_top) else
                timer_reg + 1 when i_ctl.ctr_up_down = '0' else
                timer_reg - 1;

  timer_should_update <= prescaler_reg = unsigned(i_clk_divisor);
  prescaler_next <= (others => '0') when timer_should_update else
                    prescaler_reg + 1;


  -- PWM generation

  GEN_PWM: for i in 0 to PWM_COUNT-1 generate
    turn_on_pwm(i) <= '0' when timer_reg >= unsigned(i_pwm_tops(i)) else
                      '1';
    pwm_next(i) <= turn_on_pwm(i) when i_ctl.ctr_en_pwm = '1' else
                   '0';
  end generate;

  -- capture
  ---- sync
  DO_GEN_CAPT_SYNCS: if CAPT_SYNC_WIDTH > 0 generate
    GEN_CAPT_SYNCS: for i in 0 to CAPTURE_COUNT-1 generate
      capt_sync_next(i)(0) <= i_capture(i);
      GEN_CAPT_SYNC_SHIFT: if CAPT_SYNC_WIDTH > 1 generate
        capt_sync_next(i)(CAPT_SYNC_WIDTH-1 downto 1) <= capt_sync_reg(i)(CAPT_SYNC_WIDTH-2 downto 0);
      end generate;
      i_capture_synced(i) <= capt_sync_reg(i)(CAPT_SYNC_WIDTH-1);
    end generate;
  end generate;

  DONT_GEN_CAPT_SYNCS: if CAPT_SYNC_WIDTH = 0 generate
    GEN_DIRECT_ROUTING: for i in 0 to CAPTURE_COUNT-1 generate
      i_capture_synced(i) <= i_capture(i);
    end generate;
  end generate;

  ---- edge detection
  GEN_CAPT_EDGE_DETECTORS: for i in 0 to CAPTURE_COUNT-1 generate
    capt_next(i) <= i_capture_synced(i);
    capt_edge(i) <= (i_capt_ctl(i) xor capt_reg(i)) and ((not i_capt_ctl(i)) xor capt_next(i));
  end generate;

  ---- edge priority encoding
  GEN_CAPT_PRIO_ENC: process(capt_edge) is
  begin
    capt_idx <= (others => '0');
    capt_valid <= '0';
    for i in 0 to CAPTURE_COUNT-1 loop
      if capt_edge(i) = '1' then
        capt_idx <= to_unsigned(i, log2c(CAPTURE_COUNT));
        capt_valid <= '1';
      end if;
    end loop;
  end process;

  -- outputs
  o_capture_idx <= slv(capt_idx);
  o_capture_valid <= capt_valid and i_ctl.ctr_en_capt;

  o_timer <= slv(timer_reg);
  o_pwm <= pwm_reg;


end architecture;
