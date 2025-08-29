----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:13:09 12/17/2023 
-- Design Name: 
-- Module Name:    MUX_2x1 - Behavioral 
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

entity MUX_2x1 is
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
end MUX_2x1;



architecture Behavioral of MUX_2x1 is
begin

pmux: PROCESS (x0_r_f,x0_imj_f,x1_r_f,x1_imj_f,x2_r_f,x2_imj_f,x3_r_f,x3_imj_f,x0_r_if,x0_imj_if,x1_r_if,x1_imj_if,x2_r_if,x2_imj_if,x3_r_if,x3_imj_if,sel) IS BEGIN
IF sel = "01" THEN 
			  x0_r_O <= x0_r_f;
           x0_imj_O <= x0_imj_f;
           x1_r_O <= x1_r_f;
           x1_imj_O <= x1_imj_f;
           x2_r_O <= x2_r_f;
           x2_imj_O <= x2_imj_f;
           x3_r_O <= x3_r_f;
           x3_imj_O <= x3_imj_f;
ELSIF sel = "10" THEN 
			  x0_r_O <= x0_r_if;
           x0_imj_O <= x0_imj_if;
           x1_r_O <= x1_r_if;
           x1_imj_O <= x1_imj_if;
           x2_r_O <= x2_r_if;
           x2_imj_O <= x2_imj_if;
           x3_r_O <= x3_r_if;
           x3_imj_O <= x3_imj_if;
			  
ELSE 		  x0_r_O <= (others => '0');
           x0_imj_O <= (others => '0');
           x1_r_O <= (others => '0');
           x1_imj_O <= (others => '0');
           x2_r_O <= (others => '0');
           x2_imj_O <= (others => '0');
           x3_r_O <= (others => '0');
           x3_imj_O <= (others => '0');

END IF;
END PROCESS pmux;




end Behavioral;

