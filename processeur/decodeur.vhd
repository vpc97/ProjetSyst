----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:30:34 05/29/2018 
-- Design Name: 
-- Module Name:    decodeur - Behavioral 
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

entity decodeur is
    Port ( ins_di : in  STD_LOGIC_VECTOR(31 downto 0);
           A : out  STD_LOGIC_VECTOR(15 downto 0);
           B : out  STD_LOGIC_VECTOR(15 downto 0);
           Op : out  STD_LOGIC_VECTOR(7 downto 0);
           C : out  STD_LOGIC_VECTOR(15 downto 0)
				);
end decodeur;

architecture Behavioral of decodeur is

signal aux : STD_LOGIC_VECTOR(15 downto 0);
signal aux2 : STD_LOGIC_VECTOR(15 downto 0);
signal aux3 : STD_LOGIC_VECTOR(15 downto 0);
signal aux4 : STD_LOGIC_VECTOR(15 downto 0);

begin

	Op <= ins_di(31 downto 24);
	
	aux(7 downto 0) <= ins_di(23 downto 16);
	aux(15 downto 8)<= "00000000";
	A <= 	ins_di(23 downto 8) when (ins_di(31 downto 24) = x"08" or ins_di(31 downto 24) = x"0E" or ins_di(31 downto 24) = x"0F") else
			aux;

	aux2(7 downto 0) <= ins_di(15 downto 8);
	aux2(15 downto 8) <= "00000000";
	aux4(7 downto 0) <= ins_di(7 downto 0);
	aux4(15 downto 8) <= "00000000";
	B <= 	ins_di(15 downto 0) when (ins_di(31 downto 24) = x"06" or ins_di(31 downto 24) = x"07") 
			else aux4 when ins_di(31 downto 24) = x"08" else
			aux2;

	aux3(7 downto 0) <= 	ins_di(7 downto 0);
	aux3(15 downto 8) <= "00000000";
	C <= x"0000" when (ins_di(31 downto 24) = x"06" or ins_di(31 downto 24) = x"07") else
			aux3;



end Behavioral;

