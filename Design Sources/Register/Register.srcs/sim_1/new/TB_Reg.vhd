----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 02:54:35 PM
-- Design Name: 
-- Module Name: TB_Reg - Behavioral
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

entity TB_Reg is
--  Port ( );
end TB_Reg;

architecture Behavioral of TB_Reg is

component Reg 
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal En,Reset : std_logic;
signal Clk : std_logic :='0';
signal D,Q : std_logic_vector(3 downto 0);

begin
UUT : Reg
    port map(
        D => D,
        En => En,
        Clk => Clk,
        Reset => Reset,
        Q => Q);

    process begin
        Clk <= NOT(Clk);
        wait for 20ns;
    end process;
    
    process begin
        Reset <= '1';
        wait for 50ns;
        
        Reset <= '0';
        En <= '1';
        D <= "0001";
        wait for 50ns;
        
        D <= "0010";
        wait for 50ns;
        
        D <= "0011";
        wait for 50ns;
        
        En <= '0';
        D <= "0101";
        wait for 50ns;
        
        Reset <= '1';
        wait for 50ns;
        
        Reset <= '0';
        D <= "1110";
        wait for 50ns;
        
        En <= '1';
        D <= "0101";
        wait for 50ns;
        
        Reset <= '1';
        wait for 50ns;
        
        Reset <= '0';
        D <= "1110";
        wait;        
        
    end process;        
end Behavioral;
