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
 -- "100010000110",  --MOVI R1,6
 -- "101110000100",  --MOVI R7,4
 -- "010010000000",  --NEG R1
 -- "001110010000",   --ADD R7,R1
 -- "110000000100",  -- JZR R0,4
 -- "110000000100",  -- JZR R0,4
 -- "110000000100",  -- JZR R0,4
 -- "110000000100"  -- JZR R0,4
 
   "101110000011", --MOVI R7,3 
   "100010000001", --MOVI R1,1 
   "010010000000",  --NEG R1 
   "100100000011", --MOVI R2,3 
   "000100010000", --ADD R2,R1 
   "001110100000",  --ADD R7,R2 
   "110100000110",  --JZR R2,6 
   "110000000100"  -- JZR R0,4
    ); 
 
begin 
 
Data<=Program_ROM(to_integer(unsigned(ROM_sel))); 
 
end Behavioral;