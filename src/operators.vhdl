--------------------------------------------------------------------------------
--! @file  operators.vhd
--!
--! @brief A package contains functions or procedures for common operations,
--!				 which might not be supported by the compiler.
--!
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


package operators is

	--! unary operatrs
	--! @defgroup unary_operators Unary Operators
	--! @brief Unary operators for std_logic_vector type
	--!
	--! @{
	-- edi_or is a function that performs a cascaded OR on a vector of std_logic
  function edi_or (i_vector : std_logic_vector) return std_logic;
	--! @}
  
  --! @{
  -- edi_and is a function that performs a cascaded AND on an std_logic_vector
  function edi_and (i_vector : std_logic_vector) return std_logic;
  --! @}
end package;


package body operators is

	-- EDI OR function implementation
	-- The function is implemented using a recursive process.
  function edi_or (i_vector : std_logic_vector)
	return std_logic
	is
    constant CASCADE_OR_COUNT  : natural := i_vector'length/2; -- number of cascaded ORs
    constant CASCADE_OUT_WIDTH : natural := CASCADE_OR_COUNT + i_vector'length mod 2; -- width of the output of the cascaded ORs
	  variable cascade_out : std_logic_vector(CASCADE_OUT_WIDTH-1 downto 0); -- output of the cascaded ORs
  begin -- function edi_or
		-- base cases
    if i_vector'length = 1 then
	    return i_vector(i_vector'low);
	  end if;
	  -- base cases
	  if i_vector'length = 2 then
	    return i_vector(i_vector'high) or i_vector(i_vector'low);
	  end if;
	  -- recursive case
	  for i in 0 to CASCADE_OR_COUNT-1 loop
		  cascade_out(i) := i_vector(2*i) or i_vector(2*i+1);
	  end loop;
	  -- if the number of inputs is odd, the last input is connected to the output
	  if CASCADE_OUT_WIDTH /= CASCADE_OR_COUNT then
		  cascade_out(cascade_out'high) := i_vector(i_vector'high);
	  end if;
	  -- recursive call
	  return edi_or(cascade_out);
  end function;

  function edi_and (i_vector : std_logic_vector) return std_logic is
    constant CASCADE_AND_COUNT : natural := i_vector'length/2; -- number of 
    constant CASCADE_OUT_WIDTH : natural := CASCADE_AND_COUNT + i_vector'length mod 2;
    variable cascade_out : std_logic_vector(CASCADE_OUT_WIDTH-1 downto 0);

  begin
    if i_vector'length = 1 then
      return i_vector(i_vector'low);
    end if;

    if i_vector'length = 2 then
      return i_vector(i_vector'low) and i_vector(i_vector'high);
    end if;
    
    for i in 0 to CASCADE_AND_COUNT-1 loop
      cascade_out(i) := i_vector(2*i) and i_vector(2*i+1);
    end loop;

    if CASCADE_OUT_WIDTH /= CASCADE_AND_COUNT then
      cascade_out(cascade_out'high) := i_vector(i_vector'high);
    end if;

    return edi_and(cascade_out);
  end function;
end package body;
