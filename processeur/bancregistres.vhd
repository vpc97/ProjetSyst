----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:54:27 05/17/2018 
-- Design Name: 
-- Module Name:    bancregistres - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bancregistres is
    Port ( adrA : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           adrB : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           RST : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
           QB : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
           adrW : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR(15 DOWNTO 0));
end bancregistres;

architecture Behavioral of bancregistres is
	type registerFile is array(0 to 15) of STD_LOGIC_VECTOR(15 downto 0);
	signal registers : registerFile  := (others=>(others=>'0'));
begin

	process
	begin 
		
		wait until clk'event and clk='1';
		if (RST = '0') then
			registers  <= (others=>(others=>'0'));
		elsif (W = '1') then
			registers(to_integer(unsigned(adrW))) <= DATA;
		end if;
	end process;
--	
--	if (adrA == adrW) then
--				QA <= DATA;
--			end if;
--			if (adrB == adrW) then
--				QB <= DATA;
--			end if;


	QA <= DATA when (adrA = adrW) else registers(to_integer(unsigned(adrA)));
	QB <= DATA when (adrB = adrW) else registers(to_integer(unsigned(adrB)));

end Behavioral;

