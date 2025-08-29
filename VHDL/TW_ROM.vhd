----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:05:26 12/16/2023 
-- Design Name: 
-- Module Name:    TW_ROM - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TW_ROM is
    Port ( TW4_0_R : out  STD_LOGIC_VECTOR (1 downto 0);
           TW4_0_I : out  STD_LOGIC_VECTOR (1 downto 0);
           TW4_1_R : out  STD_LOGIC_VECTOR (1 downto 0);
           TW4_1_I : out  STD_LOGIC_VECTOR (1 downto 0);
           TW4_2_R : out  STD_LOGIC_VECTOR (1 downto 0);
           TW4_2_I : out  STD_LOGIC_VECTOR (1 downto 0);
           TW4_3_R : out  STD_LOGIC_VECTOR (1 downto 0);
           TW4_3_I : out  STD_LOGIC_VECTOR (1 downto 0));
end TW_ROM;

architecture Behavioral of TW_ROM is

begin

-- +1
TW4_0_R <= "01";
TW4_0_I <= "00";

-- -j
TW4_1_R <= "00";
TW4_1_I <= "11";

-- -1
TW4_2_R <= "11";
TW4_2_I <= "00";

-- +j
TW4_3_R <= "00";
TW4_3_I <= "01";


			  
end Behavioral;