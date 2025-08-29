----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:50:56 12/16/2023 
-- Design Name: 
-- Module Name:    FFT4_TOP - Behavioral 
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
use system_v1_00_a.TW_ROM.All;
use system_v1_00_a.Butter_Fly.All;
entity FFT4_TOP is
    Port ( X0_r : in  STD_LOGIC_VECTOR (31 downto 0);
           X0_i : in  STD_LOGIC_VECTOR (31 downto 0);
           X1_r : in  STD_LOGIC_VECTOR (31 downto 0);
           X1_i : in  STD_LOGIC_VECTOR (31 downto 0);
           X2_r : in  STD_LOGIC_VECTOR (31 downto 0);
           X2_i : in  STD_LOGIC_VECTOR (31 downto 0);
           X3_r : in  STD_LOGIC_VECTOR (31 downto 0);
           X3_i : in  STD_LOGIC_VECTOR (31 downto 0);
           Y0_r : out  STD_LOGIC_VECTOR (31 downto 0);
           Y0_i : out  STD_LOGIC_VECTOR (31 downto 0);
			  Y1_r : out  STD_LOGIC_VECTOR (31 downto 0);
           Y1_i : out  STD_LOGIC_VECTOR (31 downto 0);
			  Y2_r : out  STD_LOGIC_VECTOR (31 downto 0);
           Y2_i : out  STD_LOGIC_VECTOR (31 downto 0);
			  Y3_r : out  STD_LOGIC_VECTOR (31 downto 0);
           Y3_i : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end FFT4_TOP;

architecture Behavioral of FFT4_TOP is
--component declaration
component TW_ROM is
    Port ( TW4_0_R : out  STD_LOGIC_VECTOR (1 downto 0);
           TW4_0_I : out  STD_LOGIC_VECTOR (1 downto 0);
           TW4_1_R : out  STD_LOGIC_VECTOR (1 downto 0);
           TW4_1_I : out  STD_LOGIC_VECTOR (1 downto 0);
           TW4_2_R : out  STD_LOGIC_VECTOR (1 downto 0);
           TW4_2_I : out  STD_LOGIC_VECTOR (1 downto 0);
           TW4_3_R : out  STD_LOGIC_VECTOR (1 downto 0);
           TW4_3_I : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component Butter_Fly is
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
end component;

--signals declaration 
signal TW4_0_R_sig,TW4_0_I_sig,TW4_1_R_sig,TW4_1_I_sig,TW4_2_R_sig,TW4_2_I_sig,TW4_3_R_sig,TW4_3_I_sig : STD_LOGIC_VECTOR (1 downto 0);
signal BF0_out1_r,BF0_out1_i,BF0_out2_r,BF0_out2_i : STD_LOGIC_VECTOR (31 downto 0);
signal BF1_out1_r,BF1_out1_i,BF1_out2_r,BF1_out2_i : STD_LOGIC_VECTOR (31 downto 0);

begin
TW : TW_ROM PORT MAP(TW4_0_R_sig,TW4_0_I_sig,TW4_1_R_sig,TW4_1_I_sig,TW4_2_R_sig,TW4_2_I_sig,TW4_3_R_sig,TW4_3_I_sig);
BF0: Butter_Fly PORT MAP(X0_r,X0_i,X2_r,X2_i,TW4_0_R_sig,TW4_0_I_sig,TW4_2_R_sig,TW4_2_I_sig,BF0_out1_r,BF0_out1_i,BF0_out2_r,BF0_out2_i);
BF1: Butter_Fly PORT MAP(X1_r,X1_i,X3_r,X3_i,TW4_0_R_sig,TW4_0_I_sig,TW4_2_R_sig,TW4_2_I_sig,BF1_out1_r,BF1_out1_i,BF1_out2_r,BF1_out2_i);
BF2: Butter_Fly PORT MAP(BF0_out1_r,BF0_out1_i,BF1_out1_r,BF1_out1_i,TW4_0_R_sig,TW4_0_I_sig,TW4_2_R_sig,TW4_2_I_sig,Y0_r,Y0_i,Y2_r,Y2_i);
BF3: Butter_Fly PORT MAP(BF0_out2_r,BF0_out2_i,BF1_out2_r,BF1_out2_i,TW4_1_R_sig,TW4_1_I_sig,TW4_3_R_sig,TW4_3_I_sig,Y1_r,Y1_i,Y3_r,Y3_i);



end Behavioral;

