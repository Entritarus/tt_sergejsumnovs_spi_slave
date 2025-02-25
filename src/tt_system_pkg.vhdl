library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


use work.data_types.all;
use work.functions.all;

package tt_system_pkg is
  constant RM_TIMER_CTL        : natural := 0;
  constant RM_TIMER_TOP        : natural := 1;
  constant RM_TIMER_CLK_DIV    : natural := 2;
  constant RM_TIMER_CAPT_CTL   : natural := 3;
  constant RM_GPIO_RDATA       : natural := 4;
  constant RM_GPIO_WDATA       : natural := 5;
  constant RM_GPIO_DIR         : natural := 6;
  constant RM_LFSR_POLY        : natural := 7;
  constant RM_LFSR_CTL         : natural := 8;
  constant RM_LFSR_IDATA       : natural := 9;
  constant RM_SINGLE_REG_COUNT : natural := 10;

  constant TIMER_EN : natural := 0;
  constant TIMER_UP_DOWN : natural := 1;
  constant TIMER_EN_PWM : natural := 2;
  constant TIMER_EN_CAPT : natural := 3;
  constant TIMER_RST_ON_TOP : natural := 4;

  constant GPIO_INPUT : sl := '0';
  constant GPIO_OUTPUT : sl := '1';

  constant LFSR_EN : natural := 0;
  constant LFSR_LOAD : natural := 1;
  
end package;

package body tt_system_pkg is

end package body;
