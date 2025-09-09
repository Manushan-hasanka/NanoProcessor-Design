----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 04:13:48 PM
-- Design Name: 
-- Module Name: TB_register_bank - Behavioral
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

entity TB_register_bank is
--  Port ( );
end TB_register_bank;

architecture Behavioral of TB_register_bank is

component register_bank
    Port ( Clk : in STD_LOGIC;
           reg_en : in STD_LOGIC_VECTOR (2 downto 0);
           input_data : in STD_LOGIC_VECTOR (3 downto 0);
           reset : in STD_LOGIC;
           R0_data : out STD_LOGIC_VECTOR (3 downto 0);           
           R1_data : out STD_LOGIC_VECTOR (3 downto 0);
           R2_data : out STD_LOGIC_VECTOR (3 downto 0);
           R3_data : out STD_LOGIC_VECTOR (3 downto 0);
           R4_data : out STD_LOGIC_VECTOR (3 downto 0);
           R5_data : out STD_LOGIC_VECTOR (3 downto 0);
           R6_data : out STD_LOGIC_VECTOR (3 downto 0);
           R7_data : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal R0_data, R1_data, R2_data, R3_data, R4_data, R5_data, R6_data, R7_data, input_data : std_logic_vector(3 downto 0);
signal reg_en : std_logic_vector(2 downto 0);
signal Clk, reset : std_logic := '0';

begin

UUT : register_bank
    port map(
        Clk => Clk,
        reg_en => reg_en,
        input_data => input_data,
        reset => reset,
        R0_data => R0_data,
        R1_data => R1_data,
        R2_data => R2_data,
        R3_data => R3_data,
        R4_data => R4_data,
        R5_data => R5_data,
        R6_data => R6_data,
        R7_data => R7_data);        

    process begin
        Clk <= NOT(Clk);
        wait for 20ns;
    end process;

    process begin
        reset <= '1';
        wait for 50ns;
        
        reset <= '0';
        reg_en <="001";
        input_data <= "1101";
        wait for 50ns;

        reg_en <="010";
        input_data <= "1100";
        wait for 50ns;
        
        reg_en <="011";
        input_data <= "0101";
        wait for 50ns; 
        
        reset <= '1';
        wait for 50ns;
       reset <= '0';        
        reg_en <="101";
        input_data <= "0101";
        wait for 50ns; 
        
        reg_en <="111";
        input_data <= "1101";
        wait for 50ns; 
        
        reg_en <="100";
        input_data <= "0111";
        wait for 50ns;                        
    
    end process;               
end Behavioral;
