----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:24:03 12/16/2023 
-- Design Name: 
-- Module Name:    TWIDDLE_MULTIPLIER - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TWIDDLE_MULTIPLIER is
    Port ( IN_r : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           IN_i : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           TW_r : in  STD_LOGIC_VECTOR(1 DOWNTO 0);
           TW_i : in  STD_LOGIC_VECTOR(1 DOWNTO 0);
           OUT_r : out  STD_LOGIC_VECTOR(31 DOWNTO 0);
           OUT_i : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
end TWIDDLE_MULTIPLIER;

architecture Behavioral of TWIDDLE_MULTIPLIER is

begin

tw : PROCESS (IN_r,IN_i,TW_r,TW_i) IS 
BEGIN 

IF TW_i = "00" then 
--no imaginary in TW
--check real part 
	IF TW_r = "01" then
	OUT_r  <= IN_r;
	OUT_i  <= IN_i;
	elsif TW_r = "11" then 
	OUT_r <= std_logic_vector( unsigned((not IN_r)) +1);
	OUT_i <= std_logic_vector( unsigned((not IN_i)) +1);
	else
	OUT_r  <= IN_r;
	OUT_i  <= IN_i;
	end if;
	
	
else 
--imaginary 
	IF TW_i = "01" then
	OUT_i <= IN_r;
	OUT_r <= std_logic_vector(unsigned((not IN_i)) +1);
	elsif TW_i = "11" then 
	OUT_i <= std_logic_vector(unsigned((not IN_r)) +1);
	OUT_r <= IN_i;
	else 
	OUT_r  <= IN_r;
	OUT_i  <= IN_i;
	
	end if;
end if; 


END PROCESS tw;


end Behavioral;

