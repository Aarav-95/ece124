--------
-- Lab Session: 205
-- Team Number: 25
-- Group Members: Aarav Patel, Aryan Tiwari
--------
library ieee;
use ieee.std_logic_1164.all;

-- 4bit adder entity port map
entity full_adder_4bit is
port (
	-- Input: 2 4-bit Inputs (Initialized through vector) and 1-bit Carry
	input_b, input_a			:	in std_logic_vector(3 downto 0);
	carry_in 				: 	in std_logic;
	-- Output: 1 4-bit Output (Using Vector) and 1-bit Carry
	sum						:	out std_logic_vector(3 downto 0);
	carry_out					: 	out std_logic
);

end full_adder_4bit;

-- Architecture/Logic of 4-bit adder
architecture adder_logic of full_adder_4bit is

	-- Component declared to use 1-bit adder, acts as a function to create 4-bit adder using 1-bit adder
	component full_adder_1bit port (
		-- Inputs: 2 1-bit Inputs and 1-bit Carry
		input_b, input_a, carry_in 			:	in std_logic;
		-- Outputs: 1-bit Sum and 1-bit Carry
		full_adder_carry_output, full_adder_sum_output  :	out std_logic
	);
	end component;

	-- Signals to pass carry values to next significant bit
	signal carry_out0 : std_logic;
	signal carry_out1 : std_logic;
	signal carry_out2 : std_logic;


begin
	-- Each instance maps a 1-bit input from the two input vectors and the previous carry to a new carry
	-- and 4-bit in sum vector. This results in a final carry value and a 4-bit vector with the final sum.
	INST1: full_adder_1bit port map(input_b(0), input_a(0), carry_in, carry_out0, sum(0));
	INST2: full_adder_1bit port map(input_b(1), input_a(1), carry_out0, carry_out1, sum(1));
	INST3: full_adder_1bit port map(input_b(2), input_a(2), carry_out1, carry_out2, sum(2));
	INST4: full_adder_1bit port map(input_b(3), input_a(3), carry_out2, carry_out, sum(3));


end adder_logic;
