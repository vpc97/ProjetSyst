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

entity mux_mem is
	Port (
		Op3: in STD_LOGIC_VECTOR(7 downto 0);
		B_in_m3 : in STD_LOGIC_VECTOR(15 downto 0);
		data_out : out STD_LOGIC_VECTOR(15 downto 0);
		data_in : in STD_LOGIC_VECTOR(15 downto 0)
	);
end mux_mem;

architecture Behavioral of mux_mem is

begin

	data_out <= data_in when Op3 = x"07" else B_in_m3;

end Behavioral;



