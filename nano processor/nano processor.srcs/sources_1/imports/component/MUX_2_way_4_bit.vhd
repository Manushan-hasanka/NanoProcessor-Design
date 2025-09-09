----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Ranathunga J.P.M.M
-- 
-- Create Date: 05/14/2025 01:29:17 PM
-- Design Name: 
-- Module Name: MUX_2_way_4_bit - Behavioral
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
 
entity MUX_2_way_4_bit is 
    Port ( D0 : in STD_LOGIC_VECTOR (3 downto 0); 
           D1 : in STD_LOGIC_VECTOR (3 downto 0); 
           S : in STD_LOGIC; 
           D_out : out STD_LOGIC_VECTOR (3 downto 0)); 
end MUX_2_way_4_bit; 
 
architecture Behavioral of MUX_2_way_4_bit is 
 
begin 
 
process(D0,D1,S)begin 
    if(S='0') then 
        D_out<=D0; 
    elsif(S='1') then 
        D_out<=D1; 
    end if; 
end process; 
 
end Behavioral;
