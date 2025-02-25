-------------------------------------------------------
--! @file   functions.vhd
--! @brief Package with some common handy functions
-------------------------------------------------------


library ieee;


use ieee.std_logic_1164.all;
use ieee.fixed_pkg.all;
use ieee.fixed_float_types.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.data_types.all;

package functions is
    --! @defgroup Math
    --! @brief Handy mathematical operations, can be used in vector width 
    --!        calculations
    --! @{
    function log2c (input:integer) return integer;
    function log2f (input:integer) return integer;

end package;

package body functions is

    ----------------------------------------------------------------------------
    -- Math
    ----------------------------------------------------------------------------
    function log2c( input:integer ) return integer is
    variable temp,log:integer;
    begin
        temp:=input-1;
        log:=0;
        while (temp > 0) loop
            temp:=temp/2;
            log:=log+1;
        end loop;
        return log;
    end function log2c;

    function log2f( input:integer ) return integer is
    variable temp,log:integer;
    begin
        temp:=input;
        log:=0;
        while (temp > 1) loop
            temp:=temp/2;
            log:=log+1;
        end loop;
        return log;
    end function log2f;
end package body;
