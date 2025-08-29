----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:17:58 12/16/2023 
-- Design Name: 
-- Module Name:    Butter_Fly - Behavioral 
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
use system_v1_00_a.TWIDDLE_MULTIPLIER.All;
use system_v1_00_a.Add_Imaginary.All;
entity Butter_Fly is
    Port ( IN_1_R : in  STD_LOGIC_VECTOR (31 downto 0);
           IN_1_I : in  STD_LOGIC_VECTOR (31 downto 0);
           IN_2_R : in  STD_LOGIC_VECTOR (31 downto 0);
           IN_2_I : in  STD_LOGIC_VECTOR (31 downto 0);
			  Twiddle_r_up: in  STD_LOGIC_VECTOR (1 downto 0);
			  Twiddle_i_up: in  STD_LOGIC_VECTOR (1 downto 0);
           Twiddle_r_down: in  STD_LOGIC_VECTOR (1 downto 0);
			  Twiddle_i_down: in  STD_LOGIC_VECTOR (1 downto 0);
			  OUT_1_R : out  STD_LOGIC_VECTOR (31 downto 0);
           OUT_1_I : out  STD_LOGIC_VECTOR (31 downto 0);
           OUT_2_R : out  STD_LOGIC_VECTOR (31 downto 0);
           OUT_2_I : out  STD_LOGIC_VECTOR (31 downto 0));
end Butter_Fly;

architecture Behavioral of Butter_Fly is
--component declration
component Add_Imaginary is
    Port ( IN_1_r : in  STD_LOGIC_VECTOR (31 downto 0);
           IN_1_i : in  STD_LOGIC_VECTOR (31 downto 0);
           IN_2_r : in  STD_LOGIC_VECTOR (31 downto 0);
           IN_2_i : in  STD_LOGIC_VECTOR (31 downto 0);
           OUT_r : out  STD_LOGIC_VECTOR (31 downto 0);
           OUT_i : out  STD_LOGIC_VECTOR (31 downto 0)
            );
end component;

component TWIDDLE_MULTIPLIER is
    Port ( IN_r : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           IN_i : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           TW_r : in  STD_LOGIC_VECTOR(1 DOWNTO 0);
           TW_i : in  STD_LOGIC_VECTOR(1 DOWNTO 0);
           OUT_r : out  STD_LOGIC_VECTOR(31 DOWNTO 0);
           OUT_i : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
end component;



signal TW_UP_OUT_r,TW_UP_OUT_i,TW_DOWN_OUT_r,TW_DOWN_OUT_i : STD_LOGIC_VECTOR (31 downto 0);


begin
TW_MUL_UP: TWIDDLE_MULTIPLIER PORT MAP(IN_2_R,IN_2_I,Twiddle_r_up,Twiddle_i_up,TW_UP_OUT_r,TW_UP_OUT_i);
ADD_UP : Add_Imaginary PORT MAP(IN_1_R,IN_1_I,TW_UP_OUT_r,TW_UP_OUT_i,OUT_1_R,OUT_1_I);
TW_MUL_DOWN: TWIDDLE_MULTIPLIER PORT MAP(IN_2_R,IN_2_I,Twiddle_r_down,Twiddle_i_down,TW_DOWN_OUT_r,TW_DOWN_OUT_i);
ADD_DOWN : Add_Imaginary PORT MAP(IN_1_R,IN_1_I,TW_DOWN_OUT_r,TW_DOWN_OUT_i,OUT_2_R,OUT_2_I);

end Behavioral;

