----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:39:30 05/14/2018 
-- Design Name: 
-- Module Name:    mem - Behavioral 
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

entity mem is
    Port ( p_in : in  STD_LOGIC_VECTOR(0 to 15);
           p_out : out  STD_LOGIC_VECTOR(0 to 15);
			  clk : in STD_LOGIC
			  );
end mem;

architecture Behavioral of mem is

begin
	process
	begin 
		
		wait until clk'event and clk='1';
		
		p_out <= p_in;
		
	end process;
end Behavioral;

