--------
-- Lab Session: 205
-- Team Number: 25
-- Group Members: Aarav Patel, Aryan Tiwari
--------

library ieee;
use ieee.std_logic_1164.all;

entity PB_Inverters is
	port
	(
		-- Inputs: push button inputs 
		pb_n		: in std_logic_vector(3 downto 0);
		-- Outputs: inverted push button outputs
		pb			: out std_logic_vector(3 downto 0)
	);
end PB_Inverters;

-- architecture to flip push button signals
architecture gates of PB_Inverters is

begin

pb <= NOT(pb_n);

end gates;