----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2022 02:31:37 PM
-- Design Name: 
-- Module Name: example3 - Behavioral
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

entity example3 is
  Port ( clk  : in std_logic;
         led0 : out std_logic  
  );
end example3;

architecture Behavioral of example3 is

signal count: integer   := 1;
signal tmp  : std_logic := '0';

begin
    process (clk)
    begin
        if clk' event and clk='1' then
            count <= count + 1;
            if count = 100000000 then
                count <= 1;
                tmp <= NOT tmp;
            end if;
        end if;
        led0 <= tmp;
    end process;
end Behavioral;
