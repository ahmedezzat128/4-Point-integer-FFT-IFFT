----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:01:47 12/17/2023 
-- Design Name: 
-- Module Name:    FFT - Behavioral 
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
use system_v1_00_a.BUFU.All;
use system_v1_00_a.BUFUC.All;
use system_v1_00_a.SHIFTRIGHT.All;
 
entity IFFT is
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
end IFFT;

architecture Behavioral of IFFT is

component BUFU is
    Port ( A_R : in  STD_LOGIC_VECTOR (31 downto 0);
           A_IMJ : in  STD_LOGIC_VECTOR (31 downto 0);
           B_R : in  STD_LOGIC_VECTOR (31 downto 0);
           B_IMJ : in  STD_LOGIC_VECTOR (31 downto 0);
           S_R : out  STD_LOGIC_VECTOR (31 downto 0);
           S_IMJ : out  STD_LOGIC_VECTOR (31 downto 0);
			  D_R : out  STD_LOGIC_VECTOR (31 downto 0);
           D_IMJ : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end component;

component BUFUC is
    Port ( A_R : in  STD_LOGIC_VECTOR (31 downto 0);
           A_IMJ : in  STD_LOGIC_VECTOR (31 downto 0);
           B_R : in  STD_LOGIC_VECTOR (31 downto 0);
           B_IMJ : in  STD_LOGIC_VECTOR (31 downto 0);
           S_R : out  STD_LOGIC_VECTOR (31 downto 0);
           S_IMJ : out  STD_LOGIC_VECTOR (31 downto 0);
			  D_R : out  STD_LOGIC_VECTOR (31 downto 0);
           D_IMJ : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end component;

component SHIFTRIGHT is
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
end component;


signal x0_r_S1 :  STD_LOGIC_VECTOR (31 downto 0);
signal x0_imj_S1 :   STD_LOGIC_VECTOR (31 downto 0);
signal x1_r_S1 :  STD_LOGIC_VECTOR (31 downto 0);
signal x1_imj_S1 :   STD_LOGIC_VECTOR (31 downto 0);
signal x2_r_S1 :   STD_LOGIC_VECTOR (31 downto 0);
signal x2_imj_S1 :   STD_LOGIC_VECTOR (31 downto 0);
signal x3_r_S1 : STD_LOGIC_VECTOR (31 downto 0);
signal x3_imj_S1 :  STD_LOGIC_VECTOR (31 downto 0);


 signal x0_r_d : STD_LOGIC_VECTOR (31 downto 0);
 signal x0_imj_d : STD_LOGIC_VECTOR (31 downto 0);
 signal x1_r_d : STD_LOGIC_VECTOR (31 downto 0);
 signal x1_imj_d : STD_LOGIC_VECTOR (31 downto 0);
 signal x2_r_d : STD_LOGIC_VECTOR (31 downto 0);
 signal x2_imj_d : STD_LOGIC_VECTOR (31 downto 0);
 signal x3_r_d : STD_LOGIC_VECTOR (31 downto 0);
 signal x3_imj_d : STD_LOGIC_VECTOR (31 downto 0);


begin

    BUFU_0 : BUFU Port Map (x0_r,x0_imj,x2_r,x2_imj,x0_r_S1,x0_imj_S1,x1_r_S1,x1_imj_S1);
	 BUFU_1 : BUFU Port Map (x1_r,x1_imj,x3_r,x3_imj,x2_r_S1,x2_imj_S1,x3_r_S1,x3_imj_S1);
	 
	 BUFU_2 : BUFU Port Map (x0_r_S1,x0_imj_S1,x2_r_S1,x2_imj_S1,x0_r_d ,x0_imj_d ,x2_r_d,x2_imj_d);
	 
	 BUFUC_0 : BUFUC Port MAP ( x1_r_S1,x1_imj_S1,x3_r_S1,x3_imj_S1,x1_r_d ,x1_imj_d ,x3_r_d ,x3_imj_d);
	 
	 SHIFTRIGHT_0 : SHIFTRIGHT Port MAP ( x0_r_d,x0_imj_d,x1_r_d,x1_imj_d,x2_r_d,x2_imj_d,x3_r_d,x3_imj_d,x0_r_o,x0_imj_o ,x1_r_o ,x1_imj_o ,x2_r_o ,x2_imj_o ,x3_r_o ,x3_imj_o);   
    
			  
                    

end Behavioral;

