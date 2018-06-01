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

entity mux is
	Port (
		Op: in STD_LOGIC_VECTOR(7 downto 0);
		B_in_m : in STD_LOGIC_VECTOR(15 downto 0);
		B_out_m : out STD_LOGIC_VECTOR(15 downto 0);
		adA : out STD_LOGIC_VECTOR(3 downto 0);
		QA_m : in STD_LOGIC_VECTOR(15 downto 0)
	);
end mux;

architecture Behavioral of mux is

begin

	adA <= B_in_m(3 downto 0);
	B_out_m <= B_in_m when Op = x"06" else QA_m when Op = x"05";

end Behavioral;

