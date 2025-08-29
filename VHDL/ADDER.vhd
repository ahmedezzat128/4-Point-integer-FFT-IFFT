----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:03:54 12/17/2023 
-- Design Name: 
-- Module Name:    ADDER - Behavioral 
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

entity ADDER is
    Port ( A_R : in  STD_LOGIC_VECTOR (31 downto 0);
           A_IMJ : in  STD_LOGIC_VECTOR (31 downto 0);
           B_R : in  STD_LOGIC_VECTOR (31 downto 0);
           B_IMJ : in  STD_LOGIC_VECTOR (31 downto 0);
           S_R : out  STD_LOGIC_VECTOR (31 downto 0);
           S_IMJ : out  STD_LOGIC_VECTOR (31 downto 0));
end ADDER;

architecture Behavioral of ADDER is

begin


S_R <= STD_LOGIC_VECTOR(signed(A_R) + signed(B_R));
S_IMJ <= STD_LOGIC_VECTOR(signed(A_IMJ) + signed(B_IMJ));




end Behavioral;

