----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2025 09:28:09 PM
-- Design Name: 
-- Module Name: CLA_4 - Behavioral
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

entity CLA_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC);
end CLA_4;

architecture Behavioral of CLA_4 is

Signal P , G : STD_LOGIC_VECTOR(3 downto 0);
Signal c0,c1,c2,c3 : STD_LOGIC;


begin

G <= A AND B;
P <= A XOR B;
 
c0 <= G(0) OR (P(0) and C_in);
c1 <= G(1) OR (P(1) and G(0))   OR  (P(1)and P(0) and C_in);
c2 <= G(2) OR (P(2) and G(1))   OR  (P(2) and P(1) and G(0))   OR  (P(2)and P(1)and P(0) and C_in);
c3 <= G(3) OR (P(3) and G(2))   OR (P(3) and P(2) and G(1))    OR  (P(3) and P(2) and P(1) and G(0))   OR  (P(3) and P(2)and P(1)and P(0) and C_in);

S(0) <= P(0) XOR C_in;
S(1) <= P(1) XOR c0;
S(2) <= P(2) XOR c1;
S(3) <= P(3) XOR c2;
C_out <= c3;


end Behavioral;
