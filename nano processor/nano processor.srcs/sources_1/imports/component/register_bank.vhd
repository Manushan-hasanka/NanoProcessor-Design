----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Nethsith Gunaweera
-- 
-- Create Date: 05/05/2025 12:34:44 PM
-- Design Name: 
-- Module Name: register_bank - Behavioral
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

entity register_bank is
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
end register_bank;

architecture Behavioral of register_bank is

component Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal reg_num : STD_LOGIC_VECTOR(7 downto 0);
begin

Decoder_3_to_8_0 : Decoder_3_to_8
    port map(
        I => reg_en,
        EN => '1',
        Y => reg_num);
        
R0 : Reg
    port map(
        D => "0000",
        En => '0',
        Reset => reset,
        Clk => Clk,
        Q => R0_data);

R1 : Reg
    port map(
        D => input_data,
        En => reg_num(1),
        Reset => reset,
        Clk => Clk,
        Q => R1_data);
        
R2 : Reg
    port map(
        D => input_data,
        En => reg_num(2),
        Reset => reset,
        Clk => Clk,
        Q => R2_data);
                
R3 : Reg
    port map(
        D => input_data,
        En => reg_num(3),
        Reset => reset,
        Clk => Clk,
        Q => R3_data);
                        
R4 : Reg
    port map(
        D => input_data,
        En => reg_num(4),
        Reset => reset,
        Clk => Clk,
        Q => R4_data);                                        
   
R5 : Reg
    port map(
        D => input_data,
        En => reg_num(5),
        Reset => reset,
        Clk => Clk,
        Q => R5_data); 
        
R6 : Reg
    port map(
        D => input_data,
        En => reg_num(6),
        Reset => reset,
        Clk => Clk,
        Q => R6_data);                                                 

R7 : Reg
    port map(
        D => input_data,
        En => reg_num(7),
        Reset => reset,
        Clk => Clk,
        Q => R7_data); 

end Behavioral;
