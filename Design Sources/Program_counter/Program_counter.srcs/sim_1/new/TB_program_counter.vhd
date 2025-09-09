----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Nethsith Gunaweera
-- 
-- Create Date: 05/04/2025 11:36:35 PM
-- Design Name: 
-- Module Name: TB_Programe_counter - Behavioral
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

entity TB_Program_counter is
--  Port ( );
end TB_Program_counter;

architecture Behavioral of TB_Program_counter is

component program_counter 
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Data : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal Clk : std_logic :='0'; 
signal Reset : std_logic; 
signal Data,Q : std_logic_vector(2 downto 0);

begin
    UUT : program_counter
        port map(
            Clk => Clk,
            Reset => Reset,
            Data => Data,
            Q => Q);

    process begin
        Clk <= NOT(Clk);
        wait for 20ns;
    end process;
    
    process begin
        Reset <= '0';
        Data <= "001";
        wait for 100ns;
        
        Data <= "010";
        wait for 100ns;
        
        Data <= "011";
        wait for 100ns;   
        
        Reset <= '1';
        Data <= "100";
        wait for 100ns;     
        
        Reset <= '0';
        Data <= "101";
        wait for 100ns;
        
        Data <= "110";
        wait for 100ns;
        
        Data <= "111";
        wait;
        
    end process;                
 
end Behavioral;
