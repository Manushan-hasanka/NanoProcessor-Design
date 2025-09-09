----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 12:36:42 AM
-- Design Name: 
-- Module Name: TB_Nanoprocessor - Behavioral
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

entity TB_Nanoprocessor is
--  Port ( );
end TB_Nanoprocessor;

architecture Behavioral of TB_Nanoprocessor is

component Nano_Processor 
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Zero_flag : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           Reg_7 : out STD_LOGIC_VECTOR (3 downto 0);
           seven_seg : out STD_LOGIC_VECTOR (6 downto 0));

end component;

signal Clk,Reset:std_logic :='0';
signal overflow,Zero_flag:std_logic:='0';
signal Seven_seg:std_logic_vector(6 downto 0);
signal Reg_7:std_logic_vector(3 downto 0);
begin

UUT:Nano_Processor
port map(Clk=>Clk,
         Reset=>Reset,
         overflow=>overflow,
         Zero_flag=>Zero_flag,
         Reg_7=>Reg_7,
         Seven_seg=>Seven_seg);
       

process begin
    Clk<='1';
    wait for 3ns;
    Clk<='0';
    wait for 3ns;
end process;

process begin

Reset<='1';
wait for 100ns;

Reset<='0';
wait;
end process;


end Behavioral;
