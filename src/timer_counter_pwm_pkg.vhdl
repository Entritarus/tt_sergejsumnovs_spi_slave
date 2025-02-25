library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


use work.data_types.all;

package timer_counter_pwm_pkg is
  type timer_ctl_t is record
    ctr_en         : sl;
    ctr_up_down    : sl;
    ctr_en_pwm     : sl;
    ctr_en_capt    : sl;
    ctr_rst_on_top : sl;
  end record;
end package;

package body timer_counter_pwm_pkg is
end package body;
