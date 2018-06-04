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

entity mux_alu is
	Port (
		Op2: in STD_LOGIC_VECTOR(7 downto 0);
		B_in_m2 : in STD_LOGIC_VECTOR(15 downto 0);
		B_out_m2 : out STD_LOGIC_VECTOR(15 downto 0);
		adA2 : out STD_LOGIC_VECTOR(15 downto 0);
		QA_m2 : in STD_LOGIC_VECTOR(15 downto 0)
	);
end mux_alu;

architecture Behavioral of mux_alu is

begin

	adA2 <= B_in_m2;
	B_out_m2 <= QA_m2 when (Op2 = x"01" or Op2 = x"02" or Op2 = x"03" or Op2 = x"04") else B_in_m2;

end Behavioral;

