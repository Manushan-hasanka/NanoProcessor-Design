----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2025 07:12:51 PM
-- Design Name: 
-- Module Name: Adder_3bit - Behavioral
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

entity Adder_3bit is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC);
end Adder_3bit;

architecture Behavioral of Adder_3bit is


signal P,G: STD_LOGIC_VECTOR(2 downto 0);
signal c1,c2,c3 : STD_LOGIC;


begin

G <= A and B;
P <= A XOR B;

c1 <= G(0) OR (P(0) and C_in);
c2 <= G(1) OR (P(1) and G(0))   OR  (P(1)and P(0) and C_in);
C3 <= G(2) OR (P(2) and G(1))   OR  (P(2) and P(1) and G(0))   OR  (P(2)and P(1)and P(0) and C_in);

S(0) <= P(0) XOR C_in;
S(1) <= P(1) XOR c1;
S(2) <= P(2) XOR c2;
C_out <= c3;

end Behavioral;
