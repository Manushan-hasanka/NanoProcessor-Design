----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Ranathunga J.P.M.M
-- 
-- Create Date: 05/14/2025 01:32:47 PM
-- Design Name: 
-- Module Name: MUX_8_way_4_bit - Behavioral
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
 -- Uncomment the following library declaration if using -- arithmetic functions with Signed or Unsigned values --use IEEE.NUMERIC_STD.ALL; 
 -- Uncomment the following library declaration if instantiating -- any Xilinx leaf cells in this code. --library UNISIM; --use UNISIM.VComponents.all; 
 
entity MUX_8_way_4_bit is 
    Port ( D0 : in STD_LOGIC_VECTOR (3 downto 0); 
           D1 : in STD_LOGIC_VECTOR (3 downto 0); 
           D2 : in STD_LOGIC_VECTOR (3 downto 0); 
           D3 : in STD_LOGIC_VECTOR (3 downto 0); 
           D4 : in STD_LOGIC_VECTOR (3 downto 0); 
           D5 : in STD_LOGIC_VECTOR (3 downto 0); 
           D6 : in STD_LOGIC_VECTOR (3 downto 0); 
           D7 : in STD_LOGIC_VECTOR (3 downto 0); 
           S : in STD_LOGIC_VECTOR (2 downto 0); 
           D_out : out STD_LOGIC_VECTOR (3 downto 0)); 
end MUX_8_way_4_bit; 
 
architecture Behavioral of MUX_8_way_4_bit is 
 
begin 
 
process(D0,D1,D2,D3,D4,D5,D6,D7,S) 
begin 
    if(S="000") then 
        D_out<=D0; 
    elsif(S="001") then 
        D_out<=D1; 
    elsif(S="010") then 
        D_out<=D2; 
    elsif(S="011") then 
        D_out<=D3; 
    elsif(S="100") then 
        D_out<=D4; 
    elsif(S="101") then 
        D_out<=D5; 
    elsif(S="110") then 
        D_out<=D6; 
    elsif(S="111") then 
        D_out<=D7; 
         
    end if; 
end process; 
 
end Behavioral;