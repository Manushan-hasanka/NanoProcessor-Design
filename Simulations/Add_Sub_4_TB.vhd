----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2025 12:25:59 AM
-- Design Name: 
-- Module Name: Add_Sub_4_TB - Behavioral
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

entity Add_Sub_4_TB is
--  Port ( );
end Add_Sub_4_TB;

architecture Behavioral of Add_Sub_4_TB is

Component Add_Sub_4
    port(  
       A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       Ctrl : in STD_LOGIC;
       Zero : out STD_LOGIC;
       Overflow : out STD_LOGIC;
       C_out : out STD_LOGIC;
       S : out STD_LOGIC_VECTOR (3 downto 0));
   end Component;

Signal input1 , input2 ,output : STD_LOGIC_VECTOR(3 downto 0);
Signal M, Zero_flag , Overflow_flag , C_out : STD_LOGIC;


begin

UUT :Add_Sub_4
    port map(
        A => input1,
        B => input2,
        S => output,
        C_out => C_out,
        Ctrl => M,
        Zero => Zero_flag,
        Overflow => Overflow_flag);
       
process begin 

      
        M <= '1';
        input2 <= "0101";
        input1 <= "0011";
        wait for 100ns;
        
       
        
end process ;

end Behavioral;
