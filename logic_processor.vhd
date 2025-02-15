--------
-- Lab Session: 205
-- Team Number: 25
-- Group Members: Aarav Patel, Aryan Tiwari
--------
library ieee;
use ieee.std_logic_1164.all;

-- Logic Gates 2-to-1 4 bit Multiplexer Port Map
entity logic_processor is
port (
	-- Inputs: 2 4-bit vectors representing the switches and 2-bit multiplexer select vector
	logic_in0, logic_in1 					: in std_logic_vector(3 downto 0);
	logic_select						: in std_logic_vector(1 downto 0);
	-- Output: 1 4-bit vector
	logic_out						: out std_logic_vector(3 downto 0)
);

end logic_processor;

-- Architecture/Logic of Logic Multiplexer
architecture logic_arch of logic_processor is

begin
	with logic_select(1 downto 0) select
	logic_out <= logic_in0 AND logic_in1 when "00", -- Output will be the logical AND of the two inputs if 00
				    logic_in0 OR logic_in1 when "01", -- Output will be the logical OR of the two inputs if 01
				    logic_in0 XOR logic_in1 when "10", -- Output will be the logical XOR of the two inputs if 10
				    logic_in0 XNOR logic_in1 when "11"; -- Output will be the logical XNOR of the two inputs if 11

end logic_arch;
