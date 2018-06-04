--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:40:42 06/01/2018
-- Design Name:   
-- Module Name:   /home/fkabbaj/Bureau/4A-S2/projet syst info/projetSyst/test_all.vhd
-- Project Name:  projetSyst
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: chemindonnees
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_all IS
END test_all;
 
ARCHITECTURE behavior OF test_all IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT chemindonnees
    PORT(
         ins_di : IN  std_logic_vector(31 downto 0);
			data_a : out STD_LOGIC_VECTOR(15 downto 0);
			data_we : out STD_LOGIC;
			data_di : in STD_LOGIC_VECTOR(15 downto 0);
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ins_di : std_logic_vector(31 downto 0) := x"07010203";
   signal CLK : std_logic := '0';
	signal data_di : STD_LOGIC_VECTOR(15 downto 0) := x"0101";
	
	--outputs
	signal data_we : STD_LOGIC;	
	signal data_a : STD_LOGIC_VECTOR(15 downto 0);
	
   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: chemindonnees PORT MAP (
          ins_di => ins_di,
          CLK => CLK,
			 data_di => data_di,
			 data_we => data_we,
			 data_a => data_a
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
