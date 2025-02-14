library ieee;
use ieee.std_logic_1164.all;

entity full_adder_4bit is
port (
	input_b, input_a					:	in std_logic_vector(3 downto 0);
	carry_in 							:  in std_logic;
	sum									:	out std_logic_vector(3 downto 0);
	carry_out							:  out std_logic
);

end full_adder_4bit;

architecture adder_logic of full_adder_4bit is

	component full_adder_1bit port (
		input_b, input_a, carry_in 							:	in std_logic;
		full_adder_carry_output, full_adder_sum_output  :	out std_logic
	);
	end component;

	signal carry_out0 : std_logic;
	signal carry_out1 : std_logic;
	signal carry_out2 : std_logic;
	
	
begin

	INST1: full_adder_1bit port map(input_b(0), input_a(0), carry_in, carry_out0, sum(0));
	INST2: full_adder_1bit port map(input_b(1), input_a(1), carry_out0, carry_out1, sum(1));
	INST3: full_adder_1bit port map(input_b(2), input_a(2), carry_out1, carry_out2, sum(2));
	INST4: full_adder_1bit port map(input_b(3), input_a(3), carry_out2, carry_out, sum(3));
	

end adder_logic;