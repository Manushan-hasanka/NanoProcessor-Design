----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2025 11:04:33 AM
-- Design Name: 
-- Module Name: LUT_16_7 - Behavioral
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

-- Uncomment the following library declaration if using
 --arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LUT_7_3 is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end LUT_7_3;

architecture Behavioral of LUT_7_3 is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);

signal Program_ROM : rom_type := ( 
        "100010000101", --MOVI R1, 5       (R1 = 5)
        "010010000000", --NEG R1          (R1 = -5)
        "100100000101", -- MOVI R2, 5       (R2 = 5)
        "000100010000", -- ADD R2, R1       (R2 = R2 + R1 = 0)
        "110100000110", -- JZR R2, 6        (If R2 == 0, jump to line 6)
        "100000000010", -- MOVI R0, 2       (R0 = 2)
        "000000100000", -- ADD R0, R2       (R0 = R0 + R2 = 2 + 0)
        "110000000001" --JZR R0, 1        (If R0 == 0, jump to line 1)            
);
begin

data <= Program_ROM(to_integer(unsigned(address)));

end Behavioral;
