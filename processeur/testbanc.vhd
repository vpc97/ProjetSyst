----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:47:06 05/17/2018 
-- Design Name: 
-- Module Name:    testbanc - Behavioral 
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

entity testbanc is
end testbanc;

architecture Behavioral of testbanc is

component bancregistres
	    Port ( adrA : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           adrB : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           RST : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
           QB : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
           adrW : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR(15 DOWNTO 0));
end component;

--Inputs banc
signal adrA : std_logic_vector(3 downto 0);
signal adrB : std_logic_vector(3 downto 0);
signal adrW : std_logic_vector(3 downto 0);
signal DATA : std_logic_vector(15 downto 0);
signal clk : std_logic := '0';
signal RST : std_logic := '0';
signal W : std_logic := '0';

--Output banc
signal QA : std_logic_vector(15 downto 0);
signal QB : std_logic_vector(15 downto 0);

constant CK_PERIOD : time := 10 ns;


begin

	uut: bancregistres PORT MAP (
		 adrA => adrA,
		 adrB => adrB,
		 adrW => adrW,
		 DATA => DATA,
		 CLK => CLK,
		 RST => RST,
		 W => W,
		 QA => QA,
		 QB => QB
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
		W <= '1';
		DATA <= x"0011";
		adrW <= "0001";
		adrA <= "0000";
		adrB <= "0001";
		--after 10 ns, "0000000011110000" after 30 ns;
		wait;
		
	end process;

end Behavioral;




