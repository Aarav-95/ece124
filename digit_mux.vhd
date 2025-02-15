--------
-- Lab Session: 205
-- Team Number: 25
-- Group Members: Aarav Patel, Aryan Tiwari
--------

library ieee;
use ieee.std_logic_1164.all;

-- entity port map for digit_mux
entity digit_mux is
port (
	input_b, input_a					:  in std_logic_vector(3 downto 0); -- Input: two four-bit width buses
	mux_select 							:	in std_logic; -- Input: one-bit mux selector
	output  								:	out std_logic_vector(3 downto 0) -- Output: four-bit width bus
);

end digit_mux;

-- architecture for digit_mux
architecture digit_mux_logic of digit_mux is

	

begin

	with mux_select select
		output <= input_b when '0', input_a when '1'; -- select output depending on mux selector value

end digit_mux_logic;