----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:42:18 06/01/2018 
-- Design Name: 
-- Module Name:    testchemin - Behavioral 
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

entity testchemin is
end testchemin;

architecture Behavioral of testchemin is

component chemindonnees 
	Port ( ins_di : in STD_LOGIC_VECTOR(31 downto 0) );
end component;

signal ins_di : STD_LOGIC_VECTOR(31 downto 0) := x"06010203";

begin

	uut : chemindonnees PORT MAP (
		ins_di => ins_di
	);

end Behavioral;

