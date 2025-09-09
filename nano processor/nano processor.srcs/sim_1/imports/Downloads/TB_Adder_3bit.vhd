----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 11:47:27 AM
-- Design Name: 
-- Module Name: TB_Adder_3bit - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TB_Adder_3bit is
-- No ports for testbench
end TB_Adder_3bit;

architecture behavior of TB_Adder_3bit is


    component Adder_3bit
        Port (
            A     : in  STD_LOGIC_VECTOR(2 downto 0);
            B     : in  STD_LOGIC_VECTOR(2 downto 0);
            S     : out STD_LOGIC_VECTOR(2 downto 0);
            C_out : out STD_LOGIC
        );
    end component;

    signal A     : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal B     : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal S     : STD_LOGIC_VECTOR(2 downto 0);
    signal C_out : STD_LOGIC;

begin

    
    uut: Adder_3bit
        port map (
            A     => A,
            B     => B,
            S     => S,
            C_out => C_out
        );

process
    begin
        A <= "100";
        B <= "111";
        wait for 100 ns;
        
        A <= "001";
        B <= "010";
        wait for 100 ns;
        
        A <= "000";
        B <= "111";
        
        wait;
    end process;

end behavior;
