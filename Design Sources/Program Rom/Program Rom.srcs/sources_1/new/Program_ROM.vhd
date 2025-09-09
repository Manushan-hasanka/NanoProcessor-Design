----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Ranathunga J.P.M.M
-- 
-- Create Date: 05/09/2025 09:21:22 AM
-- Design Name: 
-- Module Name: Program_ROM - Behavioral
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
use ieee.numeric_std.all; 
 -- Uncomment the following library declaration if using -- arithmetic functions with Signed or Unsigned values --use IEEE.NUMERIC_STD.ALL; 
 -- Uncomment the following library declaration if instantiating -- any Xilinx leaf cells in this code. --library UNISIM; --use UNISIM.VComponents.all; 
 
entity Program_ROM is 
    Port ( ROM_sel : in STD_LOGIC_VECTOR (2 downto 0); 
           Data : out STD_LOGIC_VECTOR (11 downto 0)); 
end Program_ROM; 
 
architecture Behavioral of Program_ROM is 
 
type ROM_type is array(0 to 7)of std_logic_vector(11 downto 0); 
 
signal Program_ROM:ROM_type :=( 
    "100010000011", -- ROM 0 ---move 3 to register 1 
    "100100000001", -- ROM 1 ---move 1 to register 2 
    "010100000000", -- ROM 2 ---2's complement of register 2 
    "001110010000", -- ROM 3 ---add register 7 and register 1 
    "000010100000", -- ROM 4 ---add register 1 and register 2 
    "110010000111", -- ROM 5 ---jump to ROM 7 , if register 1=0 ,else jump to next ROM 
    "110000000011", -- ROM 6 ---jump to ROM 3 , if register 0=0  
    "110000000111" -- ROM 7 ---jump to ROM 7 , if register 0=0 
    ); 
 
begin 
 
Data<=Program_ROM(to_integer(unsigned(ROM_sel))); 
 
end Behavioral;