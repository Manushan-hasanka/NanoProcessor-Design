----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 08:34:47 PM
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
           S : out STD_LOGIC_VECTOR (3 downto 0);
           --C_out : out STD_LOGIC;
           Overflow_flag : out STD_LOGIC;
           Zero_Flag : out STD_LOGIC
           );
end Add_Sub_4;

architecture Behavioral of Add_Sub_4 is

component FA
 port (
     A: in std_logic;
     B: in std_logic;
     C_in: in std_logic;
     S: out std_logic;
     C_out: out std_logic);
 end component;

 SIGNAL Carry  : STD_LOGIC_VECTOR(3 downto 0);
 SIGNAL B_new : STD_LOGIC_VECTOR (3 downto 0);
 SIGNAL S_Sig : STD_LOGIC_VECTOR (3 downto 0);

begin
B_new(0) <= B(0) XOR Ctrl;
B_new(1) <= B(1) XOR Ctrl;
B_new(2) <= B(2) XOR Ctrl;
B_new(3) <= B(3) XOR Ctrl;

    FA_0 : FA
        port map (
            A => A(0),
            B => B_new(0),
            C_in => Ctrl,
            S => S_Sig(0),
            C_Out => Carry(0));
    FA_1 : FA
        port map (
            A => A(1),
            B => B_new(1),
            C_in => Carry(0),
            S => S_Sig(1),
            C_Out => Carry(1));
            
    FA_2 : FA
        port map (
            A => A(2),
            B => B_new(2),
            C_in => Carry(1),
            S => S_Sig(2),
            C_Out => Carry(2));
    FA_3 : FA
        port map (
            A => A(3),
            B => B_new(3),
            C_in => Carry(2),
            S => S_Sig(3),
            C_Out => Carry(3));


Zero_Flag <= NOT (S_Sig(0) OR S_Sig(1) OR S_Sig(2) OR S_Sig(3));
S <= S_Sig;
Overflow_flag <= Carry(3) XOR Carry(2);

end Behavioral;
