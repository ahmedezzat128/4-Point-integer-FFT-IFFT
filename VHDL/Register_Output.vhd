----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:11:23 12/17/2023 
-- Design Name: 
-- Module Name:    Register_Input - Behavioral 
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

entity Register_Output is
    Port ( clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
           x0_r_input : in  STD_LOGIC_VECTOR (31 downto 0);
           x0_i_input : in  STD_LOGIC_VECTOR (31 downto 0);
           x1_r_input : in  STD_LOGIC_VECTOR (31 downto 0);
           x1_i_input : in  STD_LOGIC_VECTOR (31 downto 0);
           x2_r_input : in  STD_LOGIC_VECTOR (31 downto 0);
           x2_i_input : in  STD_LOGIC_VECTOR (31 downto 0);
           x3_r_input : in  STD_LOGIC_VECTOR (31 downto 0);
           x3_i_input : in  STD_LOGIC_VECTOR (31 downto 0);
           x0_r_ireg_out : out  STD_LOGIC_VECTOR (31 downto 0);
           x0_i_ireg_out : out  STD_LOGIC_VECTOR (31 downto 0);
           x1_r_ireg_out : out  STD_LOGIC_VECTOR (31 downto 0);
           x1_i_ireg_out : out  STD_LOGIC_VECTOR (31 downto 0);
           x2_r_ireg_out : out  STD_LOGIC_VECTOR (31 downto 0);
           x2_i_ireg_out : out  STD_LOGIC_VECTOR (31 downto 0);
           x3_r_ireg_out : out  STD_LOGIC_VECTOR (31 downto 0);
           x3_i_ireg_out : out  STD_LOGIC_VECTOR (31 downto 0));
end Register_Output;

architecture Behavioral of Register_Output is

begin

oreg: PROCESS (clk,rst)
begin
if (rst = '0') then 
x0_r_ireg_out <= (others=>'0');
x0_i_ireg_out <= (others=>'0');
x1_r_ireg_out <= (others=>'0');
x1_i_ireg_out <= (others=>'0');
x2_r_ireg_out <= (others=>'0');
x2_i_ireg_out <= (others=>'0');
x3_r_ireg_out <= (others=>'0');
x3_i_ireg_out <= (others=>'0');
elsif ( clk'event and clk='1' ) then 
x0_r_ireg_out <= x0_r_input;
x0_i_ireg_out <= x0_i_input;
x1_r_ireg_out <= x1_r_input;
x1_i_ireg_out <= x1_i_input;
x2_r_ireg_out <= x2_r_input;
x2_i_ireg_out <= x2_i_input;
x3_r_ireg_out <= x3_r_input;
x3_i_ireg_out <= x3_i_input;
end if;


end process oreg;

end Behavioral;

