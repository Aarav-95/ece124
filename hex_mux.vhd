--------
-- Lab Session: 205
-- Team Number: 25
-- Group Members: Aarav Patel, Aryan Tiwari
--------
library ieee;
use ieee.std_logic_1164.all;

-- 4-to-1 Multiplexer entity port map
entity hex_mux is
port (
	-- Inputs: 4 4-bit inputs (using vectors) and a 2-bit multiplexer selector
	hex_num3, hex_num2, hex_num1, hex_num0 : in std_logic_vector(3 downto 0);
	mux_select							   : in std_logic_vector(1 downto 0);
	-- Outputs: 1 4-bit Vector
	hex_out								   : out std_logic_vector(3 downto 0)
);

end hex_mux;

-- Architecture/Logic of 4-to-1 4-bit multiplexer
architecture mux_logic of hex_mux is

begin

	with mux_select(1 downto 0) select
	hex_out <= hex_num0 when "00", -- Output will be hex_num0 if mux_select is 00
				  hex_num1 when "01", -- Output will be hex_num1 if mux_select is 01
				  hex_num2 when "10", -- Output will be hex_num2 if mux_select is 10
				  hex_num3 when "11"; -- Output will be hex_num3 if mux_select is 11

end mux_logic;
