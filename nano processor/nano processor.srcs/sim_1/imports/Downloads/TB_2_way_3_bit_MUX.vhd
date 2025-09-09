----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Ranathunga J.P.M.M
-- 
-- Create Date: 05/05/2025 04:27:21 PM
-- Design Name: 
-- Module Name: TB_2_way_3_bit_MUX - Behavioral
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
 -- any Xilinx leaf cells in this code. --library UNISIM; --use UNISIM.VComponents.all; 
 
entity TB_2_way_3_bit_MUX is 
--  Port ( ); 
end TB_2_way_3_bit_MUX; 
 
architecture Behavioral of TB_2_way_3_bit_MUX is 
 
component MUX_2_way_3_bit 
    port( D0:in std_logic_vector(2 downto 0); 
          D1:in std_logic_vector(2 downto 0); 
          S:in std_logic;  
          D_out:out std_logic_vector(2 downto 0) 
          ); 
end component; 
 
signal D0,D1,D_out:std_logic_vector(2 downto 0); 
signal S:std_logic; 
           
begin 
 
UUT:MUX_2_way_3_bit 
 port map(D0=>D0, 
          D1=>D1, 
          S=>S, 
          D_out => D_out); 
           
process begin 

-- 230524P
-- 2 = 010
-- 3 = 011
-- 0 = 000
-- 5 = 101
-- 4 = 100
 
   D0 <= "010";
   D1 <= "011";
   S  <= '0';
   wait for 100 ns;

   D0 <= "000";
   D1 <= "101";
   S  <= '1';
   wait for 100 ns;

   D0 <= "010";
   D1 <= "100";
   S  <= '0';
   wait for 100 ns;

   D0 <= "011";
   D1 <= "000";
   S  <= '1';
   wait for 100 ns;

   D0 <= "101";
   D1 <= "010";
   S  <= '1';
   wait;

end process; 
end Behavioral; 