----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:09:57 06/01/2018 
-- Design Name: 
-- Module Name:    mux - Behavioral 
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

entity mux_str is
	Port (
		Op4: in STD_LOGIC_VECTOR(7 downto 0);
		A_in_s : in STD_LOGIC_VECTOR(15 downto 0);
		s_out : out STD_LOGIC_VECTOR(15 downto 0);
		B_in_s : in STD_LOGIC_VECTOR(15 downto 0)
	);
end mux_str;

architecture Behavioral of mux_str is

begin

	s_out <= A_in_s when Op4 = x"08" else B_in_s;

end Behavioral;



