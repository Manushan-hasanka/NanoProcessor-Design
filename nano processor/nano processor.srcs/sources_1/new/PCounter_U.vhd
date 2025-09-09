----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 09:50:30 AM
-- Design Name: 
-- Module Name: PCounter_U - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity PCounter_U is
    Port (
        clk         : in  STD_LOGIC;
        reset       : in  STD_LOGIC;
        jump_flag   : in  STD_LOGIC;
        jump_addr   : in  STD_LOGIC_VECTOR(2 downto 0);
        mem_select  : out STD_LOGIC_VECTOR(2 downto 0)
    );
end PCounter_U;

architecture Behavioral of PCounter_U is
    signal pc : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
begin
    process(clk, reset)
    begin
        if reset = '1' then
            pc <= (others => '0');
        elsif rising_edge(clk) then
            if jump_flag = '1' then
                pc <= jump_addr;
            else
                pc <= std_logic_vector(unsigned(pc) + 1);
            end if;
        end if;
    end process;

    mem_select <= pc;
end Behavioral;