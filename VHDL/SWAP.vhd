----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:16:00 12/17/2023 
-- Design Name: 
-- Module Name:    SWAP - Behavioral 
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

entity SWAP is
    Port ( B_R : in  STD_LOGIC_VECTOR (31 downto 0);
           B_IMJ : in  STD_LOGIC_VECTOR (31 downto 0);
           B_R_N : out  STD_LOGIC_VECTOR (31 downto 0);
           B_IMJ_N : out  STD_LOGIC_VECTOR (31 downto 0));
end SWAP;

architecture Behavioral of SWAP is
begin

B_R_N <= STD_LOGIC_VECTOR(unsigned(Not B_IMJ) + 1);

B_IMJ_N <= B_R;



end Behavioral;

