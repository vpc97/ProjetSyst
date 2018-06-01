----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:52:47 05/29/2018 
-- Design Name: 
-- Module Name:    chemindonnees - Behavioral 
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

entity chemindonnees is
	Port (
		ins_di : in STD_LOGIC_VECTOR(31 downto 0);
		CLK : in STD_LOGIC
	);
end chemindonnees;

architecture Behavioral of chemindonnees is

component decodeur
    Port ( ins_di : in  STD_LOGIC_VECTOR(31 downto 0);
           A : out  STD_LOGIC_VECTOR(15 downto 0);
           B : out  STD_LOGIC_VECTOR(15 downto 0);
           Op : out  STD_LOGIC_VECTOR(7 downto 0);
           C : out  STD_LOGIC_VECTOR(15 downto 0)
				);
end component;

signal A : STD_LOGIC_VECTOR(15 downto 0);
signal B : STD_LOGIC_VECTOR(15 downto 0);
signal Op : STD_LOGIC_VECTOR(7 downto 0);
signal C : STD_LOGIC_VECTOR(15 downto 0);

component pipeline
    Port ( A_in : in  STD_LOGIC_VECTOR(15 downto 0);
			  A_out : out  STD_LOGIC_VECTOR(15 downto 0);
           Op_in : in  STD_LOGIC_VECTOR(7 downto 0);
			  Op_out : out  STD_LOGIC_VECTOR(7 downto 0);
           B_in : in  STD_LOGIC_VECTOR(15 downto 0);
			  B_out : out  STD_LOGIC_VECTOR(15 downto 0);
			  C_in : in  STD_LOGIC_VECTOR(15 downto 0);
			  C_out : out  STD_LOGIC_VECTOR(15 downto 0);
           clk : in  STD_LOGIC
			  );
end component;

component bancregistres 
	Port ( adrA : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           adrB : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           RST : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
           QB : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
           adrW : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR(15 DOWNTO 0)
			 );
end component; 

--Inputs banc
signal adA : std_logic_vector(3 downto 0);
signal adrB : std_logic_vector(3 downto 0);
signal adrW : std_logic_vector(3 downto 0);
signal DATA : std_logic_vector(15 downto 0);
signal RST : std_logic;
signal W : std_logic;

--Output banc
signal QA : std_logic_vector(15 downto 0);
signal QB : std_logic_vector(15 downto 0);


component lc 
	Port ( 	Op : in  STD_LOGIC_VECTOR(7 downto 0);
				Res : out STD_LOGIC
				);	
end component;

signal Res : STD_LOGIC;

component mux 
	Port (
		Op: in STD_LOGIC_VECTOR(7 downto 0);
		B_in_m : in STD_LOGIC_VECTOR(15 downto 0);
		B_out_m : out STD_LOGIC_VECTOR(15 downto 0);
		adA : out STD_LOGIC_VECTOR(3 downto 0);
		QA_m : in STD_LOGIC_VECTOR(15 downto 0)
	);
end component;

signal B_out_m : STD_LOGIC_VECTOR(15 downto 0);

type stage is record
	Op : STD_LOGIC_VECTOR(7 downto 0);
	a,b,c : STD_LOGIC_VECTOR(15 downto 0);
end record;

signal li, di, ex, mem : stage;

begin
	
	
	dec : decodeur PORT MAP (
		ins_di => ins_di,
		A => A,
		B => B,
		C => C,
		Op => Op
	);

	li_di : pipeline PORT MAP (
		clk => clk,
		A_in => A,
		B_in => B,
		C_in => C,
		Op_in => Op,
		A_out => li.a,
		B_out => li.b,
		C_out => li.c,
		Op_out => li.Op
	);
	
	di_ex : pipeline PORT MAP (
		clk => clk,
		A_in => li.a,
		B_in => B_out_m,
		C_in => li.c,
		Op_in => li.Op,
		A_out => di.a,
		B_out => di.b,
		C_out => di.c,
		Op_out => di.Op
	);
	
	ex_mem : pipeline PORT MAP (
		clk => clk,
		A_in => di.a,
		B_in => di.b,
		C_in => di.c,
		Op_in => di.Op,
		A_out => ex.a,
		B_out => ex.b,
		C_out => ex.c,
		Op_out => ex.Op
	);
	
	mem_re : pipeline PORT MAP (
		clk => clk,
		A_in => ex.a,
		B_in => ex.b,
		C_in => ex.c,
		Op_in => ex.Op,
		A_out => mem.a,
		B_out => mem.b,
		C_out => mem.c,
		Op_out => mem.Op
	);
	
	ulc : lc PORT MAP (
		Op => mem.Op,
		Res => Res
	);
	
	bancreg : bancregistres PORT MAP (
		adrA => adA,
		adrB => adrB,
		adrW => mem.a(3 downto 0),
		DATA => mem.b,
		clk => clk,
		RST => RST,
		W => Res,
		QA => QA,
		QB => QB
	);
	
	umux : mux PORT MAP (
		Op => li.Op,
		B_in_m => li.b,
		B_out_m => B_out_m,
		adA => adA, 
		QA_m => QA
	);
	
end Behavioral;

