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
	    Port ( A : in  STD_LOGIC_VECTOR(15 downto 0);
           B : in  STD_LOGIC_VECTOR(15 downto 0);
           Op : in  STD_LOGIC_VECTOR(1 downto 0);
           S : out  STD_LOGIC_VECTOR(15 downto 0);
           FlagC, FlagZ, FlagN, FlagO : out  STD_LOGIC
			  );
end component;

--Inputs

signal A : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000"; 
signal B : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
signal Op : STD_LOGIC_VECTOR(1 downto 0) := "00";
signal FlagC : STD_LOGIC;
signal FlagZ : STD_LOGIC;
signal FlagN : STD_LOGIC;
signal FlagO : STD_LOGIC;

--Output
signal S : STD_LOGIC_VECTOR(15 downto 0);

--constant CK_PERIOD : time := 10 ns;


begin

	uut: alu PORT MAP (
		A => A,
		B => B,
		Op => Op,
		S => S,
		FlagC => FlagC,
		FlagZ => FlagZ,
		FlagN => FlagN,
		FlagO => FlagO
	);
	
	stim_proc : process
	begin
		A <= "0000000000000001";--"1111111111111111";-- after 10 ns, "0000000011110000" after 30 ns;
		B <= "0000000000000001";
		Op <= "00";
		wait;
	end process;

end Behavioral;
