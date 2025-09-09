----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 09:37:10 PM
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
          S : out STD_LOGIC_VECTOR (3 downto 0);
          Overflow_flag : out STD_LOGIC;
          Zero_Flag : out STD_LOGIC);
end Component;

Signal input1,input2 ,output : STD_LOGIC_VECTOR(3 downto 0);
Signal M, Zero , Overflow : STD_LOGIC;

begin

UUT : Add_Sub_4
    port map(
        A => input1,
        B => input2,
        Ctrl => M,
        S => output,
        Zero_flag => Zero,
        Overflow_flag => Overflow);
        
 process begin 
       
        M <= '1';
        input1 <= "0110";
        input2 <= "0100";
        wait for 100ns;
        
        M <= '0';
        input1 <= "0101";
        input2 <= "1000";
        wait for 100ns;
        

end process;        
       
end Behavioral;
