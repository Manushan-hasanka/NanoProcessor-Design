----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 04:53:13 PM
-- Design Name: 
-- Module Name: TB_TSB_Set_8_4bit - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_TSB_Set_8_4bit is
--  Port ( );
end TB_TSB_Set_8_4bit;

architecture Behavioral of TB_TSB_Set_8_4bit is
component TSB_Set_8_4bit
        Port (
            I0,I1,I2,I3,I4,I5,I6,I7 : in std_logic_vector (3 downto 0);
            S : in std_logic_vector (2 downto 0);
            Y : out std_logic_vector (3 downto 0)
        );
end component;
    
signal I0,I1,I2,I3,I4,I5,I6,I7 : std_logic_vector(3 downto 0);
signal S : std_logic_vector(2 downto 0);
signal Y : std_logic_vector(3 downto 0);

begin
uut: TSB_Set_8_4bit
        port map (
            I0 => I0, I1 => I1, I2 => I2, I3 => I3,
            I4 => I4, I5 => I5, I6 => I6, I7 => I7,
            S => S,
            Y => Y
        );
        
-- 230524P  

process 
begin
I0 <= "1111";
I1 <= "0010";
I2 <= "0011";
I3 <= "0000";
I4 <= "0101";
I5 <= "0010";
I6 <= "0100";
I7 <= "0011";

for i in 0 to 7 loop
    S <= std_logic_vector(to_unsigned(i, 3));
    wait for 100 ns;
end loop;

end process;
end Behavioral;
