--------------------------------------------------------------------------------
--! @file  data_types.vhd
--! @brief Data types and shorthands
--------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.fixed_pkg.all;

package data_types is


    --! @defgroup types_slv
    --! @brief Deriver types based on std_logic_vector base type
    --! @{
    type array_of_std_logic_vector    is array(integer range <>) of std_logic_vector;
    --! @}


    -- shorthand - standard_logic_vector
    alias sl       is std_logic;
    alias slv      is std_logic_vector;
    alias aslv     is array_of_std_logic_vector;


    --!///@{
    procedure edi_cast( signal data_out : out aslv;       signal data_in : in slv);
    
    procedure edi_cast( signal data_out : out slv;        signal data_in : in aslv);


    procedure edi_cast_variable( variable data_out : out aslv;       variable data_in : in slv);

    procedure edi_cast_variable( variable data_out : out slv;        variable data_in : in aslv);

    --!///@}
end package;

package body data_types is

    procedure edi_cast_variable( variable data_out : out aslv; variable data_in : in slv) is
        constant VECTOR_WIDTH : natural := data_out(0)'length;
        variable bit_high     : natural;
        variable bit_low      : natural;
    begin
        for i in data_out'range loop
            bit_high    := (i+1)*VECTOR_WIDTH-1;
            bit_low     := i*VECTOR_WIDTH;
            data_out(i) := data_in( bit_high downto bit_low);
        end loop;
    end procedure;

    procedure edi_cast_variable( variable data_out : out slv; variable data_in : in aslv) is
        constant VECTOR_WIDTH : natural := data_in(0)'length;
        variable bit_high     : natural;
        variable bit_low      : natural;
    begin
        for i in data_in'range loop
            bit_high    := (i+1)*VECTOR_WIDTH-1;
            bit_low     := i*VECTOR_WIDTH;
            data_out( bit_high downto bit_low) := data_in(i);
        end loop;
    end procedure;


    procedure edi_cast( signal data_out : out aslv; signal data_in : in slv) is
        variable data_out_v : array_of_std_logic_vector(data_out'range)(data_out(0)'range);
        variable data_in_v  : std_logic_vector(data_in'range);
    begin
        data_in_v := data_in;
        edi_cast_variable(data_out_v, data_in_v);
        data_out <= data_out_v;
    end procedure;

    procedure edi_cast( signal data_out : out slv; signal data_in : in aslv) is
        variable data_out_v : std_logic_vector(data_out'range);
        variable data_in_v  : array_of_std_logic_vector(data_in'range)(data_in(0)'range);
    begin
        data_in_v := data_in;
        edi_cast_variable(data_out_v, data_in_v);
        data_out <= data_out_v;
    end procedure;



end package body;
