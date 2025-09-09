----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 03:16:51 PM
-- Design Name: 
-- Module Name: instruction_decoder - Behavioral
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

entity instruction_decoder is
    Port (instruction_bus : in STD_LOGIC_VECTOR (11 downto 0);
          Reg_chek_jump : in STD_logic_vector(3 downto 0);
          Reg_ena : out std_logic_vector(2 downto 0);
          immediate_value : out std_logic_vector(3 downto 0);
          Add_Sub_sel : out std_logic;
          load_sel : out std_logic;
          Reg_sel_1 : out std_logic_vector(2 downto 0);
          Reg_sel_2 : out std_logic_vector(2 downto 0);
          jump_flag : out std_logic;
          address_jump : out std_logic_vector(2 downto 0)

           );
end instruction_decoder;

architecture Behavioral of instruction_decoder is

begin

process(instruction_bus,Reg_chek_jump) begin
if (instruction_bus(11)= '0'  ) then
    if (instruction_bus(10) = '0') then
        Reg_sel_1 <= instruction_bus(9 downto 7);
        Reg_sel_2 <= instruction_bus(6 downto 4);
        Add_Sub_sel <= '0';
        Reg_ena <= instruction_bus(9 downto 7);
        immediate_value <= instruction_bus(3 downto 0);
        load_sel <= '0';
        jump_flag <= '0';
        address_jump <= "000";
    else
        Reg_sel_1 <= "000";
        Reg_sel_2 <= instruction_bus(9 downto 7);
        Reg_ena <= instruction_bus(9 downto 7);
        Add_Sub_sel <= '1';
        load_sel <= '0';
        immediate_value <= "0000";
        jump_flag <= '0';
        address_jump <= "000";
    end if;
else
        if(instruction_bus(10)='0') then
            Reg_ena <= instruction_bus(9 downto 7);
            immediate_value <= instruction_bus(3 downto 0);
            load_sel <= '1';
            jump_flag <= '0';
            Reg_sel_1 <= "000";
            Reg_sel_2 <= "000";
            Add_Sub_sel <= '1';
            address_jump <= "000";
        else 
            Reg_sel_1 <= instruction_bus(9 downto 7);
            Reg_sel_2 <= "000";
            Add_Sub_sel <= '0';
            immediate_value <= "0000";
            Reg_ena <= "000";
            if (Reg_chek_jump = "0000") then 
                jump_flag <= '1';
                address_jump <= instruction_bus(2 downto 0);
            end if;
        end if;
  end if;
end process;            
end Behavioral;
