----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 01:33:12 PM
-- Design Name: 
-- Module Name: TB_Program_ROM - Behavioral
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

entity TB_Program_ROM is
--  Port ( );
end TB_Program_ROM;

architecture Behavioral of TB_Program_ROM is

component Program_ROM  
    Port ( ROM_sel : in STD_LOGIC_VECTOR (2 downto 0); 
           Data : out STD_LOGIC_VECTOR (11 downto 0)); 
end component;
 
signal ROM_sel: std_logic_vector(2 downto 0);
signal Data : std_logic_vector(11 downto 0);
 
begin

UUT : Program_ROM
port map(ROM_sel => ROM_sel,
         Data => Data);
         
process begin
    ROM_sel <= "101";
    wait for 100ns;

    ROM_sel <= "001";
    wait for 100ns;
    
    ROM_sel <= "101";
    wait for 100ns;
    
    ROM_sel <= "001";
    wait for 100ns; 
end process;
   
end Behavioral;
