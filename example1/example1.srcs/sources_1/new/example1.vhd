----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2022 01:35:24 AM
-- Design Name: 
-- Module Name: example1 - Behavioral
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


entity example1 is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           F : out STD_LOGIC);
end example1;

architecture Behavioral of example1 is

begin

F <= x xor Y;

end Behavioral;
