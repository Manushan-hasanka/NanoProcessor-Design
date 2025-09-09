----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 03:57:43 PM
-- Design Name: 
-- Module Name: Nano_Processor - Behavioral
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

entity Nano_Processor is
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Zero_flag : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           Reg_7 : out STD_LOGIC_VECTOR (3 downto 0);
           seven_seg : out STD_LOGIC_VECTOR (6 downto 0);
           anode : out STD_LOGIC_VECTOR (3 downto 0));
end Nano_Processor;

architecture Behavioral of Nano_Processor is

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

component Add_Sub_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Ctrl : in STD_LOGIC;
           Overflow_flag : out STD_LOGIC;
           Zero_Flag : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component LUT_16_7
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
            clk : in std_logic;
            an : out std_logic_vector(3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component MUX_2_way_4_bit is 
    Port ( D0 : in STD_LOGIC_VECTOR (3 downto 0); 
           D1 : in STD_LOGIC_VECTOR (3 downto 0); 
           S : in STD_LOGIC; 
           D_out : out STD_LOGIC_VECTOR (3 downto 0)); 
end component; 

component MUX_8_way_4_bit  
    Port ( D0 : in STD_LOGIC_VECTOR (3 downto 0); 
           D1 : in STD_LOGIC_VECTOR (3 downto 0); 
           D2 : in STD_LOGIC_VECTOR (3 downto 0); 
           D3 : in STD_LOGIC_VECTOR (3 downto 0); 
           D4 : in STD_LOGIC_VECTOR (3 downto 0); 
           D5 : in STD_LOGIC_VECTOR (3 downto 0); 
           D6 : in STD_LOGIC_VECTOR (3 downto 0); 
           D7 : in STD_LOGIC_VECTOR (3 downto 0); 
           S : in STD_LOGIC_VECTOR (2 downto 0); 
           D_out : out STD_LOGIC_VECTOR (3 downto 0)); 
end component; 

component Program_ROM 
    Port ( ROM_sel : in STD_LOGIC_VECTOR (2 downto 0); 
           Data : out STD_LOGIC_VECTOR (11 downto 0)); 
end component; 

component Slow_Clk 
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component;

component instruction_Decoder 
     Port ( instruction_bus : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_chek_jump : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_ena : out STD_LOGIC_VECTOR (2 downto 0);
           load_sel : out STD_LOGIC;
           immediate_value : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_sel_1 : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_sel_2 : out std_logic_vector(2 downto 0);
           Add_Sub_sel : out STD_LOGIC;
           jump_flag : out STD_LOGIC;
           address_jump : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component PCounter_U
Port (
        clk         : in  STD_LOGIC;
        reset       : in  STD_LOGIC;
        jump_flag   : in  STD_LOGIC;
        jump_addr   : in  STD_LOGIC_VECTOR(2 downto 0);
        mem_select  : out STD_LOGIC_VECTOR(2 downto 0)
    );
end component;

signal Clk_Slow, carry_3bit_adder, load_sel ,Add_Sub_sel, jump_flag, Zero_unit, parity_unit, Overflow_unit:std_logic;
signal PC_out, adder_3bit_out, Reg_en, Reg_sel_0, Reg_sel_1, address_jump, Mux_2_3_out:std_logic_vector(2 downto 0);
signal ROM_out:std_logic_vector(11 downto 0);
signal immediate_value, Mux_2_4_out, MUX_8_way_4_bit_1_out, MUX_8_way_4_bit_0_out, Add_sub_unit_out:std_logic_vector(3 downto 0);
signal R0,R1,R2,R3,R4,R5,R6,R7:std_logic_vector(3 downto 0);
signal segment_out:std_logic_vector(6 downto 0);

begin

Slow_Clk_0 : Slow_Clk
port map(Clk_in => Clk,
         Clk_out => Clk_Slow);
         
register_bank_0 : register_bank
port map( Clk => Clk_Slow,
          reg_en => Reg_en,
          input_data => Mux_2_4_out,
          reset => Reset,
          R0_data => R0, 
          R1_data => R1,
          R2_data => R2,
          R3_data => R3,
          R4_data => R4,
          R5_data => R5,
          R6_data => R6,
          R7_data => R7 );

MUX_8_way_4_bit_0 : MUX_8_way_4_bit
Port map(  D0 => R0,
           D1 => R1,
           D2 => R2,
           D3 => R3,
           D4 => R4,
           D5 => R5,
           D6 => R6,
           D7 => R7,
           s => Reg_sel_0,
           D_out => MUX_8_way_4_bit_0_out );
           
MUX_8_way_4_bit_1 : MUX_8_way_4_bit
Port map( D0 => R0,
          D1 => R1,
          D2 => R2,
          D3 => R3,
          D4 => R4,
          D5 => R5,
          D6 => R6,
          D7 => R7,
          s => Reg_sel_1,
          D_out => MUX_8_way_4_bit_1_out );
          
Add_Sub_4_0 : Add_Sub_4
Port map(A => MUX_8_way_4_bit_0_out,
         B => MUX_8_way_4_bit_1_out,
         Ctrl => Add_Sub_sel,
         Zero_Flag => Zero_unit,
         Overflow_flag  =>Overflow_unit,
         S => Add_sub_unit_out);
                  
Program_Counter : PCounter_U
port map(
        clk  => Clk_Slow,     
        reset => Reset,     
        jump_flag => jump_flag,
        jump_addr => address_jump,
        mem_select => PC_out);
           
MUX_2_way_4_bit_0:MUX_2_way_4_bit
port map( D0 =>Add_sub_unit_out,  
          D1 =>immediate_value,
          S =>load_sel,
          D_out =>Mux_2_4_out);           

program_ROM_0:program_ROM
port map(ROM_sel=>PC_out,
         Data=>ROM_out);

LUT_16_7_0 : LUT_16_7
port map(address => R7,
           clk => Clk,
           an => anode,
         data => segment_out);
         
instruction_Decoder_0:instruction_Decoder
port map(instruction_bus => ROM_out,
        Reg_chek_jump =>  MUX_8_way_4_bit_0_out,--8 way 4 bit mux out
        Reg_ena => Reg_en,
        load_sel => load_sel,  
        immediate_value => immediate_value, 
        Reg_sel_1 => Reg_sel_0,
        Reg_sel_2 => Reg_sel_1,
        Add_Sub_sel => Add_Sub_sel,
        jump_flag =>jump_flag,
        address_jump =>address_jump);


Zero_flag <= Zero_unit;
Overflow  <= Overflow_unit;
Reg_7 <= R7;
seven_seg <= segment_out;       
           
          
end Behavioral;
