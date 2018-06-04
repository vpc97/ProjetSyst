----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:03:00 05/14/2018 
-- Design Name: 
-- Module Name:    testalu - Behavioral 
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

entity testalu is
end testalu;

architecture Behavioral of testalu is

component alu 
	    Port ( A_alu : in  STD_LOGIC_VECTOR(15 downto 0);
           B_alu : in  STD_LOGIC_VECTOR(15 downto 0);
           Ctrl_Alu : in  STD_LOGIC_VECTOR(7 downto 0);
           S : out  STD_LOGIC_VECTOR(15 downto 0);
           FlagC, FlagZ, FlagN, FlagO : out  STD_LOGIC
			  );
end component;

--Inputs

signal A_alu : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000"; 
signal B_alu : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
signal Ctrl_Alu : STD_LOGIC_VECTOR(7 downto 0) := x"01";
signal FlagC : STD_LOGIC;
signal FlagZ : STD_LOGIC;
signal FlagN : STD_LOGIC;
signal FlagO : STD_LOGIC;

--Output
signal S : STD_LOGIC_VECTOR(15 downto 0);

--constant CK_PERIOD : time := 10 ns;


begin

	uut: alu PORT MAP (
		A_alu => A_alu,
		B_alu => B_alu,
		Ctrl_Alu => Ctrl_Alu,
		S => S,
		FlagC => FlagC,
		FlagZ => FlagZ,
		FlagN => FlagN,
		FlagO => FlagO
	);
	
	stim_proc : process
	begin
		A_alu<= "0000000000000001";--"1111111111111111";-- after 10 ns, "0000000011110000" after 30 ns;
		B_alu <= "0000000000000001";
		Ctrl_Alu <= x"01";
		wait;
	end process;

end Behavioral;
