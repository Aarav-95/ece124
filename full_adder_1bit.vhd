--------
-- Lab Session: 205
-- Team Number: 25
-- Group Members: Aarav Patel, Aryan Tiwari
--------
library ieee;
use ieee.std_logic_1164.all;

-- 1bit adder entity port map
entity full_adder_1bit is
port (
	input_b, input_a, carry_in 						:	in std_logic; -- Input: 2 1-bit inputs and 1-bit carry
	full_adder_carry_output, full_adder_sum_output  :	out std_logic -- Output: 1-bit carry and 1-bit sum
);

end full_adder_1bit;

-- Architecture/Logic for 1-bit adder
architecture adder_logic of full_adder_1bit is

begin
	-- Carry is calculated using the specific logic gates with the inputs and carry
	full_adder_carry_output <= (input_a AND input_b) OR ((input_a XOR input_b) AND carry_in);
	-- Sum is calculated by XOR of input A and input B, then XOR with carry in
	full_adder_sum_output <= (input_a XOR input_b) XOR carry_in;

end adder_logic;