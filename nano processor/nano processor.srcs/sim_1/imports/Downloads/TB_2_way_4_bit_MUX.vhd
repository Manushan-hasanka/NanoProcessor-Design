----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Ranathunga J.P.M.M
-- 
-- Create Date: 05/15/2025 03:04:08 PM
-- Design Name: 
-- Module Name: TB_2_way_4_bit_MUX - Behavioral
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

entity TB_2_way_4_bit_MUX is
-- Port( );
end TB_2_way_4_bit_MUX;

architecture Behavioral of TB_2_way_4_bit_MUX is

component MUX_2_way_4_bit
    Port ( D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           D_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal D0, D1, D_out : STD_LOGIC_VECTOR(3 downto 0);
signal S : STD_LOGIC;

begin

UUT: MUX_2_way_4_bit
    port map(
        D0 => D0,
        D1 => D1,
        S => S,
        D_out => D_out
    );

--  2  -> 0010
--  3  -> 0011
--  0  -> 0000
--  5  -> 0101
--  2  -> 0010
--  4  -> 0100

process
begin
    D0 <= "0010";
    D1 <= "0011";
    S <= '0';
    wait for 100 ns;

    D0 <= "0000";
    D1 <= "0101";
    S <= '1';
    wait for 100 ns;

    D0 <= "0010";
    D1 <= "0100";
    S <= '0';
    wait for 100 ns;

    D0 <= "0011";
    D1 <= "0000";
    S <= '1';
    wait for 100 ns;

    D0 <= "0101";
    D1 <= "0010";
    S <= '1';
    wait;
end process;

end Behavioral;
