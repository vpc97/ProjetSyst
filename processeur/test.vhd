----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:38:26 05/14/2018 
-- Design Name: 
-- Module Name:    test - Behavioral 
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

entity test is

end test;

architecture Behavioral of test is

component mem 
	    Port ( p_in : in  STD_LOGIC_VECTOR(15 downto 0);
			  clk : in  STD_LOGIC;
           p_out : out  STD_LOGIC_VECTOR(15 downto 0)
			  );
end component;

--Inputs mem

signal p_in : std_logic_vector(15 downto 0);
signal clk : std_logic := '0';

--Output mem
signal p_out : std_logic_vector(15 downto 0);

constant CK_PERIOD : time := 10 ns;


begin

	uut: mem PORT MAP (
		p_in => p_in,
		clk => clk,
		p_out => p_out
	);
	
	CK_processs : process
	begin
		clk <= '0';
		wait for CK_PERIOD/2;
		clk <= '1';
		wait for CK_PERIOD/2;
	end process;
	
	stim_proc : process
	begin
		p_in <= "0000000011111111" after 10 ns, "0000000011110000" after 30 ns;
		wait;
		
	end process;

end Behavioral;



