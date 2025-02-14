library ieee;
use ieee.std_logic_1164.all;

entity digit_mux is
port (
	input_b, input_a					:  in std_logic_vector(3 downto 0);
	mux_select 							:	in std_logic;
	output  								:	out std_logic_vector(3 downto 0)
);

end digit_mux;

architecture digit_mux_logic of digit_mux is

	

begin

	with mux_select select
		output <= input_b when '0', input_a when '1';

end digit_mux_logic;