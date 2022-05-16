----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2022 01:45:55 AM
-- Design Name: 
-- Module Name: example2 - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity example2 is
    Port ( btnC : in STD_LOGIC;
           led0 : out STD_LOGIC);
end example2;


architecture Behavioral of example2 is

begin

led0 <= btnC;

end Behavioral;
