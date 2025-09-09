----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Nethsith Gunaweera
-- 
-- Create Date: 05/04/2025 11:19:26 PM
-- Design Name: 
-- Module Name: programe_counter - Behavioral
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

entity program_counter is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Data : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end program_counter;

architecture Behavioral of program_counter is
component D_FF
    Port ( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           En : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

begin
    D_FF_0 : D_FF
        port map(
            D => Data(0),
            Clk => Clk,
            Res => Reset,
            EN => '1',
            Q => Q(0));
    D_FF_1 : D_FF
        port map(
            D => Data(1),
            Clk => Clk,
            Res => Reset,
            EN => '1',
            Q => Q(1));
    D_FF_2 : D_FF
        port map(
            D => Data(2),
            Clk => Clk,
            Res => Reset,
            EN => '1',
            Q => Q(2));
            
end Behavioral;
