----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2025 08:19:24 PM
-- Design Name: 
-- Module Name: Add_Sub_4 - Behavioral
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

entity Add_Sub_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Ctrl : in STD_LOGIC;
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           C_out : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end Add_Sub_4;

architecture Behavioral of Add_Sub_4 is

Component CLA_4
    port(
          A : in STD_LOGIC_VECTOR (3 downto 0);
          B : in STD_LOGIC_VECTOR (3 downto 0);
          C_in : in STD_LOGIC;
          S : out STD_LOGIC_VECTOR (3 downto 0);
          C_out : out STD_LOGIC);
    end Component;

Signal B_new ,G , P ,S_internal : STD_LOGIC_VECTOR( 3 downto 0);
Signal c2 ,c3 ,C_out_internal : STD_LOGIC;


begin
B_new(0) <= B(0) XOR Ctrl;
B_new(1) <= B(1) XOR Ctrl;
B_new(2) <= B(2) XOR Ctrl;
B_new(3) <= B(3) XOR Ctrl;

G <= A AND B;
P <= A XOR B;

c2 <= G(2) OR (P(2) and G(1))   OR  (P(2) and P(1) and G(0))   OR  (P(2)and P(1)and P(0) and Ctrl);
c3 <= G(3) OR (P(3) and G(2))   OR  (P(3) and P(2) and G(1))    OR  (P(3) and P(2) and P(1) and G(0))   OR  (P(3) and P(2)and P(1)and P(0) and Ctrl);


CLA_4_1 : CLA_4
    port map(
        A => A,
        B => B_new,
        C_in => Ctrl,
        S => S_internal,
        C_out => C_out_internal);

Zero <= NOT(S_internal(0)) AND  NOT(S_internal(1)) AND  NOT(S_internal(2)) AND NOT(S_internal(3)) AND NOT(C_out_internal);
S <= S_internal;
Overflow <= c2 XOR c3;
C_out <= C_out_internal;       
        
end Behavioral;
