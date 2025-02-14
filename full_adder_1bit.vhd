library ieee;
use ieee.std_logic_1164.all;

entity full_adder_1bit is
port (
	input_b, input_a, carry_in 							:	in std_logic;
	full_adder_carry_output, full_adder_sum_output  :	out std_logic
);

end full_adder_1bit;

architecture adder_logic of full_adder_1bit is

begin

	full_adder_carry_output <= (input_a AND input_b) OR ((input_a XOR input_b) AND carry_in);
	full_adder_sum_output <= (input_a XOR input_b) XOR carry_in;

end adder_logic;