----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2025 07:50:12 PM
-- Design Name: 
-- Module Name: Adde_3bit_TB - Behavioral
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

entity Adde_3bit_TB is
--  Port ( );
end Adde_3bit_TB;

architecture Behavioral of Adde_3bit_TB is

Component Adder_3bit
    port(
       A : in STD_LOGIC_VECTOR (2 downto 0);
       B : in STD_LOGIC_VECTOR (2 downto 0);
       C_in : in STD_LOGIC;
       S : out STD_LOGIC_VECTOR (2 downto 0);
       C_out : out STD_LOGIC);
    end Component;
   
Signal input1,input2,output : STD_LOGIC_VECTOR(2 downto 0);
Signal c_input,c_output : STD_LOGIC;
   
    
begin


UUT: Adder_3bit
    port map(
        A => input1,
        B => input2,
        C_in=> c_input,
        S => output,
        C_out => c_output);
        
 process begin 
    
    --ADD 101(5) and 010 (2)  = 111 (7)
    c_input  <= '0';
    input1 <= "101";
    input2 <= "010";
    wait for 100ns;
    
    --ADD 111(7) and 010 (2)  = 1 111 (9)
    c_input  <= '0';
    input1 <= "111";
    input2 <= "010";
    wait for 100ns;
    
    --ADD 111(7) and 111 (7)  = 1 110 (14)
    c_input  <= '0';
    input1 <= "111";
    input2 <= "111";
    wait for 100ns;
        
end process;        

        
        

end Behavioral;
