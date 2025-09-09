----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2025 09:37:31 PM
-- Design Name: 
-- Module Name: CLA_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CLA_TB is
--  Port ( );
end CLA_TB;

architecture Behavioral of CLA_TB is

Component CLA_4
  port (
        A : in STD_LOGIC_VECTOR (3 downto 0);
        B : in STD_LOGIC_VECTOR (3 downto 0);
        C_in : in STD_LOGIC;
        S : out STD_LOGIC_VECTOR (3 downto 0);
        C_out : out STD_LOGIC);
   end Component;


Signal input_1,input_2,output : STD_LOGIC_VECTOR(3 downto 0);
Signal c_input , c_output : STD_LOGIC;

begin

UUT : CLA_4
    port map(
        A => input_1,
        B => input_2,
        C_in => c_input,
        S => output,
        C_out => c_output);
        

process begin 
        
        -- ADD 11 +  1 
        c_input <= '1';
        input_1 <= "0101";
        input_2 <= "1101";
        wait for 100ns;
        

        
        
        
end process;      
        
end Behavioral;


