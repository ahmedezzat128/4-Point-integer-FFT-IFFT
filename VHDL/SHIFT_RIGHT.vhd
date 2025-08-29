----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:29:47 12/17/2023 
-- Design Name: 
-- Module Name:    SHIFT_RIGHT - Behavioral 
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

entity SHIFTRIGHT is
    Port ( x0_r : in  STD_LOGIC_VECTOR (31 downto 0);
           x0_imj : in  STD_LOGIC_VECTOR (31 downto 0);
           x1_r : in  STD_LOGIC_VECTOR (31 downto 0);
           x1_imj : in  STD_LOGIC_VECTOR (31 downto 0);
           x2_r : in  STD_LOGIC_VECTOR (31 downto 0);
           x2_imj : in  STD_LOGIC_VECTOR (31 downto 0);
           x3_r : in  STD_LOGIC_VECTOR (31 downto 0);
           x3_imj : in  STD_LOGIC_VECTOR (31 downto 0);
           x0_r_d : out  STD_LOGIC_VECTOR (31 downto 0);
           x0_imj_d : out  STD_LOGIC_VECTOR (31 downto 0);
           x1_r_d : out  STD_LOGIC_VECTOR (31 downto 0);
           x1_imj_d : out  STD_LOGIC_VECTOR (31 downto 0);
           x2_r_d : out  STD_LOGIC_VECTOR (31 downto 0);
           x2_imj_d : out  STD_LOGIC_VECTOR (31 downto 0);
           x3_r_d : out  STD_LOGIC_VECTOR (31 downto 0);
           x3_imj_d : out  STD_LOGIC_VECTOR (31 downto 0));
end SHIFTRIGHT;

architecture Behavioral of SHIFTRIGHT is

begin


x0_r_d <= std_logic_vector(shift_right(signed(x0_r),2));x0_imj_d <= std_logic_vector(shift_right(signed(x0_imj),2));x1_r_d <= std_logic_vector(shift_right(signed(x1_r),2));x1_imj_d <= std_logic_vector(shift_right(signed(x1_imj),2));x2_r_d <= std_logic_vector(shift_right(signed(x2_r),2));x2_imj_d <= std_logic_vector(shift_right(signed(x2_imj),2));x3_r_d <= std_logic_vector(shift_right(signed(x3_r),2));x3_imj_d <= std_logic_vector(shift_right(signed(x3_imj),2));


end Behavioral;

