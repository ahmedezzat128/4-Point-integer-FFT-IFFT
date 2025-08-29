----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:53:21 12/17/2023 
-- Design Name: 
-- Module Name:    FFT_SYS - Behavioral 
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

entity FFT_SYS is
    Port ( x0_r : in  STD_LOGIC_VECTOR (31 downto 0);
           x0_imj : in  STD_LOGIC_VECTOR (31 downto 0);
           x1_r : in  STD_LOGIC_VECTOR (31 downto 0);
           x1_imj : in  STD_LOGIC_VECTOR (31 downto 0);
           x2_r : in  STD_LOGIC_VECTOR (31 downto 0);
           x2_imj : in  STD_LOGIC_VECTOR (31 downto 0);
           x3_r : in  STD_LOGIC_VECTOR (31 downto 0);
           x3_imj : in  STD_LOGIC_VECTOR (31 downto 0);
           SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           x0_r_o : out  STD_LOGIC_VECTOR (31 downto 0);
           x0_imj_o : out  STD_LOGIC_VECTOR (31 downto 0);
           x1_r_o : out  STD_LOGIC_VECTOR (31 downto 0);
           x1_imj_o : out  STD_LOGIC_VECTOR (31 downto 0);
           x2_r_o : out  STD_LOGIC_VECTOR (31 downto 0);
           x2_imj_o : out  STD_LOGIC_VECTOR (31 downto 0);
           x3_r_o : out  STD_LOGIC_VECTOR (31 downto 0);
           x3_imj_o : out  STD_LOGIC_VECTOR (31 downto 0));
end FFT_SYS;

architecture Behavioral of FFT_SYS is


component MUX_2x1 is
    Port ( x0_r_f : in  STD_LOGIC_VECTOR (31 downto 0);
           x0_imj_f : in  STD_LOGIC_VECTOR (31 downto 0);
           x1_r_f : in  STD_LOGIC_VECTOR (31 downto 0);
           x1_imj_f : in  STD_LOGIC_VECTOR (31 downto 0);
           x2_r_f : in  STD_LOGIC_VECTOR (31 downto 0);
           x2_imj_f : in  STD_LOGIC_VECTOR (31 downto 0);
           x3_r_f : in  STD_LOGIC_VECTOR (31 downto 0);
           x3_imj_f : in  STD_LOGIC_VECTOR (31 downto 0);
           x0_r_if : in  STD_LOGIC_VECTOR (31 downto 0);
           x0_imj_if : in  STD_LOGIC_VECTOR (31 downto 0);
           x1_r_if : in  STD_LOGIC_VECTOR (31 downto 0);
           x1_imj_if : in  STD_LOGIC_VECTOR (31 downto 0);
           x2_r_if : in  STD_LOGIC_VECTOR (31 downto 0);
           x2_imj_if : in  STD_LOGIC_VECTOR (31 downto 0);
           x3_r_if : in  STD_LOGIC_VECTOR (31 downto 0);
           x3_imj_if : in  STD_LOGIC_VECTOR (31 downto 0);
			  sel : in  STD_LOGIC_VECTOR (1 downto 0);
           x0_r_O : out  STD_LOGIC_VECTOR (31 downto 0);
           x0_imj_O : out  STD_LOGIC_VECTOR (31 downto 0);
           x1_r_O : out  STD_LOGIC_VECTOR (31 downto 0);
           x1_imj_O : out  STD_LOGIC_VECTOR (31 downto 0);
           x2_r_O : out  STD_LOGIC_VECTOR (31 downto 0);
           x2_imj_O : out  STD_LOGIC_VECTOR (31 downto 0);
           x3_r_O : out  STD_LOGIC_VECTOR (31 downto 0);
           x3_imj_O : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component FFT4_TOP is
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
end component;




component IFFT is
    Port ( x0_r : in  STD_LOGIC_VECTOR (31 downto 0);
           x0_imj : in  STD_LOGIC_VECTOR (31 downto 0);
           x1_r : in  STD_LOGIC_VECTOR (31 downto 0);
           x1_imj : in  STD_LOGIC_VECTOR (31 downto 0);
           x2_r : in  STD_LOGIC_VECTOR (31 downto 0);
           x2_imj : in  STD_LOGIC_VECTOR (31 downto 0);
           x3_r : in  STD_LOGIC_VECTOR (31 downto 0);
           x3_imj : in  STD_LOGIC_VECTOR (31 downto 0);
           x0_r_o : out  STD_LOGIC_VECTOR (31 downto 0);
           x0_imj_o : out  STD_LOGIC_VECTOR (31 downto 0);
           x1_r_o : out  STD_LOGIC_VECTOR (31 downto 0);
           x1_imj_o : out  STD_LOGIC_VECTOR (31 downto 0);
           x2_r_o : out  STD_LOGIC_VECTOR (31 downto 0);
           x2_imj_o : out  STD_LOGIC_VECTOR (31 downto 0);
           x3_r_o : out  STD_LOGIC_VECTOR (31 downto 0);
           x3_imj_o : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Register_Input is
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
           mux_selector : in  STD_LOGIC_VECTOR (1 downto 0);
           x0_r_ireg_out : out  STD_LOGIC_VECTOR (31 downto 0);
           x0_i_ireg_out : out  STD_LOGIC_VECTOR (31 downto 0);
           x1_r_ireg_out : out  STD_LOGIC_VECTOR (31 downto 0);
           x1_i_ireg_out : out  STD_LOGIC_VECTOR (31 downto 0);
           x2_r_ireg_out : out  STD_LOGIC_VECTOR (31 downto 0);
           x2_i_ireg_out : out  STD_LOGIC_VECTOR (31 downto 0);
           x3_r_ireg_out : out  STD_LOGIC_VECTOR (31 downto 0);
           x3_i_ireg_out : out  STD_LOGIC_VECTOR (31 downto 0);
           mux_selector_out : out  STD_LOGIC_VECTOR (1 downto 0));
end component;


component Register_Output is
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
end component;

signal           x0_r_ireg_out :   STD_LOGIC_VECTOR (31 downto 0);
signal           x0_i_ireg_out :   STD_LOGIC_VECTOR (31 downto 0);
signal           x1_r_ireg_out :   STD_LOGIC_VECTOR (31 downto 0);
signal           x1_i_ireg_out :   STD_LOGIC_VECTOR (31 downto 0);
signal           x2_r_ireg_out :   STD_LOGIC_VECTOR (31 downto 0);
signal           x2_i_ireg_out :   STD_LOGIC_VECTOR (31 downto 0);
signal           x3_r_ireg_out :   STD_LOGIC_VECTOR (31 downto 0);
signal           x3_i_ireg_out :   STD_LOGIC_VECTOR (31 downto 0);
signal           mux_selector_out :   STD_LOGIC_VECTOR (1 downto 0);


signal           x0_r_f :   STD_LOGIC_VECTOR (31 downto 0);
signal           x0_imj_f :   STD_LOGIC_VECTOR (31 downto 0);
signal           x1_r_f :   STD_LOGIC_VECTOR (31 downto 0);
signal           x1_imj_f :   STD_LOGIC_VECTOR (31 downto 0);
signal           x2_r_f :   STD_LOGIC_VECTOR (31 downto 0);
signal           x2_imj_f :   STD_LOGIC_VECTOR (31 downto 0);
signal           x3_r_f : STD_LOGIC_VECTOR (31 downto 0);
signal           x3_imj_f :   STD_LOGIC_VECTOR (31 downto 0);
signal           x0_r_if : STD_LOGIC_VECTOR (31 downto 0);
signal           x0_imj_if :   STD_LOGIC_VECTOR (31 downto 0);
signal           x1_r_if :   STD_LOGIC_VECTOR (31 downto 0);
signal           x1_imj_if :   STD_LOGIC_VECTOR (31 downto 0);
signal           x2_r_if :   STD_LOGIC_VECTOR (31 downto 0);
signal           x2_imj_if :   STD_LOGIC_VECTOR (31 downto 0);
signal           x3_r_if : STD_LOGIC_VECTOR (31 downto 0);
signal           x3_imj_if : STD_LOGIC_VECTOR (31 downto 0);


signal           x0_r_r :   STD_LOGIC_VECTOR (31 downto 0);
signal           x0_imj_r :   STD_LOGIC_VECTOR (31 downto 0);
signal           x1_r_r :   STD_LOGIC_VECTOR (31 downto 0);
signal           x1_imj_r :   STD_LOGIC_VECTOR (31 downto 0);
signal           x2_r_r :  STD_LOGIC_VECTOR (31 downto 0);
signal           x2_imj_r :   STD_LOGIC_VECTOR (31 downto 0);
signal           x3_r_r :   STD_LOGIC_VECTOR (31 downto 0);
signal           x3_imj_r :   STD_LOGIC_VECTOR (31 downto 0);


begin

Register_Input_0 : Register_Input Port Map(CLK,RST,x0_r,x0_imj,x1_r,x1_imj,x2_r,x2_imj,x3_r,x3_imj,SEL,x0_r_ireg_out,x0_i_ireg_out,x1_r_ireg_out,x1_i_ireg_out,x2_r_ireg_out,x2_i_ireg_out,x3_r_ireg_out,x3_i_ireg_out,mux_selector_out);

IFFT_0 : IFFT Port Map(x0_r_ireg_out,x0_i_ireg_out,x1_r_ireg_out,x1_i_ireg_out,x2_r_ireg_out,x2_i_ireg_out,x3_r_ireg_out,x3_i_ireg_out,x0_r_if,x0_imj_if,x1_r_if,x1_imj_if,x2_r_if,x2_imj_if,x3_r_if,x3_imj_if);

FFT4_TOP_0 : FFT4_TOP Port Map(x0_r_ireg_out,x0_i_ireg_out,x1_r_ireg_out,x1_i_ireg_out,x2_r_ireg_out,x2_i_ireg_out,x3_r_ireg_out,x3_i_ireg_out,x0_r_f,x0_imj_f,x1_r_f,x1_imj_f,x2_r_f,x2_imj_f,x3_r_f,x3_imj_f);

MUX_2x1_0 : MUX_2x1 Port Map( x0_r_f,x0_imj_f,x1_r_f,x1_imj_f,x2_r_f,
           x2_imj_f,
           x3_r_f,
           x3_imj_f,
           x0_r_if,
           x0_imj_if,
           x1_r_if,
           x1_imj_if,
           x2_r_if,
           x2_imj_if,
           x3_r_if,
           x3_imj_if,
			  mux_selector_out,x0_r_r,x0_imj_r,x1_r_r,x1_imj_r,x2_r_r,x2_imj_r,x3_r_r,x3_imj_r);
			  
			  
Register_Output_0 : Register_Output Port MAP(CLK,RST,x0_r_r,x0_imj_r,x1_r_r,x1_imj_r,x2_r_r,x2_imj_r,x3_r_r,x3_imj_r,x0_r_o,
           x0_imj_o,
           x1_r_o,
           x1_imj_o,
           x2_r_o,
           x2_imj_o,
           x3_r_o,
           x3_imj_o);
           	  
			  
          




end Behavioral;

