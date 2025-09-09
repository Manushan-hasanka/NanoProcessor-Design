----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Nethsith Gunaweera
-- 
-- Create Date: 03/06/2025 06:19:22 PM
-- Design Name: 
-- Module Name: TB_Decoder_2_to_4 - Behavioral
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

entity TB_Decoder_2_to_4 is
--  Port ( );
end TB_Decoder_2_to_4;

architecture Behavioral of TB_Decoder_2_to_4 is
component Decoder_2_to_4
Port (
    I : IN std_logic_vector(1 downto 0);
    EN : in STD_LOGIC;
    Y : OUT std_logic_vector(3 downto 0)
);
end component;
Signal I : STD_LOGIC_VECTOR (1 downto 0);
Signal EN : STD_LOGIC;
Signal Y : STD_LOGIC_VECTOR (3 downto 0);

begin
UUT: Decoder_2_to_4
    PORT MAP( 
    I => I,
    EN => EN,
    Y => Y
    );
    
process
    begin
    I <= "00";
    EN <= '1';
    wait for 100 ns;
    I <= "01";
    wait for 100 ns;
    I <= "10";
    wait for 100 ns;
    I <= "11";
    wait for 100 ns;
    I <= "00";
    EN <= '0';
    wait for 100 ns;
    I <= "01";
    wait for 100 ns;
    I <= "10";
    wait for 100 ns;
    I <= "11";
    wait;
    end process;
    
end Behavioral;
