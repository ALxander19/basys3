----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2022 07:40:16 PM
-- Design Name: 
-- Module Name: example5 - Behavioral
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


entity example5 is
    generic ( COUNTER_SIZE : integer := 10_000 );
    port ( clk        : in  std_logic;
           reset      : in  std_logic;
           button_in  : in  std_logic;
           led0       : out  std_logic);
           --button_out : out std_logic);
end example5;

architecture Behavioral of example5 is

signal flipflop_1       : std_logic := '0';     -- output of flip-flop 1
signal flipflop_2       : std_logic := '0';     -- output of flip-flop 2
signal flipflop_3       : std_logic := '0';     -- output of flip-flop 3
signal flipflop_4       : std_logic := '0';     -- output of flip-flop 4
signal count_start      : std_logic := '0';
signal button_out       : std_logic := '0';
signal tmp              : integer := 0;

begin

    input_flipflops: process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then
                flipflop_1 <= '0';
                flipflop_2 <= '0';
            else
                flipflop_1 <= button_in;
                flipflop_2 <= flipflop_1;
            end if;
        end if;
    end process input_flipflops;


    count_start <= flipflop_1 xor flipflop_2;


    pause_counter: process(clk)
        variable count: integer range 0 to COUNTER_SIZE := 0;
    begin
        if rising_edge(clk) then
            if (reset = '1') then
                count := 0;
                flipflop_3 <= '0';
            else
                if (count_start = '1') then
                    count := 0;
                elsif (count < COUNTER_SIZE) then
                    count := count + 1;
                else
                    flipflop_3 <= flipflop_2;
                end if;
            end if;
        end if;
    end process pause_counter;


    output_flipflop: process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then
                flipflop_4 <= '0';
            else
                flipflop_4 <= flipflop_3;
            end if;
        end if;
    end process output_flipflop;


    with flipflop_3 select
    button_out <= flipflop_3 xor flipflop_4 when '1',
                  '0'                       when others;

    
    process(button_out)
    begin
        if rising_edge(button_out) then
            tmp <= tmp + 1;
            if (reset = '1') then
                tmp <= 0;
                led0 <= '0';
            else
                if tmp >= 5 then
                    led0 <= '1';
                end if;
            end if;
        end if;
    end process;

end Behavioral;
