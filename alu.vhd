----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:56:26 05/14/2018 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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
use ieee.std_logic_unsigned.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( A : in  STD_LOGIC_VECTOR(15 downto 0);
           B : in  STD_LOGIC_VECTOR(15 downto 0);
           Op : in  STD_LOGIC_VECTOR(1 downto 0);
           S : out  STD_LOGIC_VECTOR(15 downto 0);
           FlagC, FlagZ, FlagN, FlagO : out  STD_LOGIC
			  );
end alu;

architecture Behavioral of alu is

	signal R : STD_LOGIC_VECTOR(15 downto 0);
	signal Radd : STD_LOGIC_VECTOR(16 downto 0);
	signal Rmul : STD_LOGIC_VECTOR(31 downto 0);
	--signal Rdiv : STD_LOGIC_VECTOR(15 downto 0);

begin

	Rmul <=  A*B;
	Radd <= ('0' & A) + ('0' & B);
	--Rdiv <= std_logic_vector((signed(A)/signed(B)));
	R <= 	Radd(15 downto 0) when Op="00" else
			A-B when Op="01" else
			Rmul(15 downto 0) when Op="10"; --else
			--Rdiv(15 downto 0) when Op="11";
	--Radd <= ('0' & A) + ('0' & B);		
	
	FlagC <= Radd(16);
	FlagZ <= '1' when R=x"0000" else '0';
	FlagN <= '1' when R<0 else '0';
	FlagO <= '1' when (Op="00" & not Radd(16)) else '0';
	S <= R;
	

end Behavioral;

