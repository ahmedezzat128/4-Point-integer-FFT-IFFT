----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:30:30 12/16/2023 
-- Design Name: 
-- Module Name:    Add_Imaginary - Behavioral 
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

entity Add_Imaginary is
    Port ( IN_1_r : in  STD_LOGIC_VECTOR (31 downto 0);
           IN_1_i : in  STD_LOGIC_VECTOR (31 downto 0);
           IN_2_r : in  STD_LOGIC_VECTOR (31 downto 0);
           IN_2_i : in  STD_LOGIC_VECTOR (31 downto 0);
           OUT_r : out  STD_LOGIC_VECTOR (31 downto 0);
           OUT_i : out  STD_LOGIC_VECTOR (31 downto 0)
            );
end Add_Imaginary;

architecture Behavioral of Add_Imaginary is

begin

OUT_r <= std_logic_vector( signed(IN_1_r) + signed(IN_2_r) );
OUT_i <= std_logic_vector( signed(IN_1_i) + signed(IN_2_i));


end Behavioral;

