----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2025 02:51:19 PM
-- Design Name: 
-- Module Name: Slow_Clk - Behavioral
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

entity Slow_Clk is
    Port (
        clk_in  : in  STD_LOGIC;
        clk_out : out STD_LOGIC
    );
end Slow_Clk;

architecture Behavioral of Slow_Clk is
    signal count : unsigned(1 downto 0) := (others => '0');  -- 2-bit counter
    --signal count : unsigned(26 downto 0) := (others => '0');  -- 27-bit counter

    signal clk_reg : STD_LOGIC := '0';
begin

    process(clk_in)
    begin
        if rising_edge(clk_in) then
            if count = "01" then  -- match your old 'count = 2' logic
            --if count = 49_999_999 then  -- Toggle at 50 million

                clk_reg <= not clk_reg;
                count <= (others => '0');
            else
                count <= count + 1;
            end if;
        end if;
    end process;

    clk_out <= clk_reg;

end Behavioral;

