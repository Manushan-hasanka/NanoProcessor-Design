----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Nethsith Gunaweera
-- 
-- Create Date: 04/06/2025 12:43:09 PM
-- Design Name: 
-- Module Name: TB_D_FF - Behavioral
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

entity TB_D_FF is
--  Port ( );
end TB_D_FF;

architecture Behavioral of TB_D_FF is
component D_FF
    port( D , Res ,Clk, En : in std_logic;
          Q : out std_logic);
end component;
signal D, Res, En : std_logic;
signal Q  : std_logic;
signal Clk : std_logic := '0';

begin
    UUT : D_FF
        port Map(
            D => D,
            Res => Res,
            En => En,
            Clk =>Clk,
            Q => Q);
    process
    begin
        Clk <= NOT(Clk);
        wait for 20ns;
    end process;
    
    process
    begin
    En <= '1';
    D<='1';
    wait for 50 ns;
    
    Res<='1';
    D<='1';
    wait for 50 ns;
    
    Res<='0';
    D<='1';
    wait for 50 ns;
    
    D<='0';
    wait for 50 ns; 
    
    end process;
    
end Behavioral;
