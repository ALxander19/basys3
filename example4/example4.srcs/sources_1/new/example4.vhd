----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2022 03:18:21 PM
-- Design Name: 
-- Module Name: example4 - Behavioral
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
use IEEE.numeric_std.ALL;

entity example4 is
  Port ( clk     : in std_logic;
         reset   : in std_logic;
         led0    : out std_logic;
         an      : out std_logic_vector(3 downto 0);
         seg     : out std_logic_vector(6 downto 0) );
end example4;

architecture Behavioral of example4 is

signal count     : integer   := 1;
signal tmp       : std_logic := '0';
signal count_out : integer   := 0;
signal an_conf   : std_logic_vector(3 downto 0) := "0000";

begin
    process (clk,reset)
    begin
        if reset='0' then
            count <= 1;
            count_out <= 0;
        elsif clk' event and clk='1' then
            count <= count + 1;
            if count = 100000000 then
                count <= 1;
                count_out <= count_out + 1;
                tmp <= NOT tmp;
            end if;
        end if;
        led0 <= tmp;
    end process;
    
    process (count_out)
    begin
        an <= an_conf;
        case count_out is
            when 0 => seg <= "1000000"; -- 0
            when 1 => seg <= "1001111"; -- 1
            when 2 => seg <= "0100100"; -- 2
            when 3 => seg <= "0110000"; -- 3
            when 4 => seg <= "0011001"; -- 4
            when 5 => seg <= "0010010"; -- 5
            when 6 => seg <= "0000010"; -- 6
            when 7 => seg <= "1111000"; -- 7
            when 8 => seg <= "0000000"; -- 8
            when 9 => seg <= "0010000"; -- 9
            when others => seg <= "1111111";
        end case;
    end process;
end Behavioral;