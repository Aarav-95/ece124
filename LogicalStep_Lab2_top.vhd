--------
-- Lab Session: 205
-- Team Number: 25
-- Group Members: Aarav Patel, Aryan Tiwari
--------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity LogicalStep_Lab2_top is port (
   clkin_50			: in	std_logic;
	pb_n				: in	std_logic_vector(3 downto 0);
 	sw   				: in  std_logic_vector(7 downto 0); -- The switch inputs
   leds				: out std_logic_vector(7 downto 0); -- for displaying the switch content
   seg7_data 		: out std_logic_vector(6 downto 0); -- 7-bit outputs to a 7-segment
	seg7_char1  	: out	std_logic;				    		-- seg7 digit1 selector
	seg7_char2  	: out	std_logic				    		-- seg7 digit2 selector

);
end LogicalStep_Lab2_top;

architecture SimpleCircuit of LogicalStep_Lab2_top is
--
-- Components Used ---
-------------------------------------------------------------------
   component SevenSegment port (
		hex   		:  in  std_logic_vector(3 downto 0);   -- The 4 bit data to be displayed
		sevenseg 	:  out std_logic_vector(6 downto 0)    -- 7-bit outputs to a 7-segment
   );
   end component;

	component segment7_mux port (
		clk		: in std_logic := '0';  -- 
		DIN2		: in std_logic_vector(6 downto 0);
		DIN1		: in std_logic_vector(6 downto 0);
		DOUT		: out std_logic_vector(6 downto 0);
		DIG2		: out std_logic;
		DIG1		: out std_logic
	);
	end component;

	component PB_Inverters port (
		pb_n		: in std_logic_vector(3 downto 0);
		pb			: out std_logic_vector(3 downto 0)
	);
	end component;

	component logic_processor port (
		logic_in0, logic_in1 		: in std_logic_vector(3 downto 0);
		logic_select					: in std_logic_vector(1 downto 0);
		logic_out						: out std_logic_vector(3 downto 0)
	);
	end component;

	component full_adder_4bit port (
		input_b, input_a					:	in std_logic_vector(3 downto 0);
		carry_in 							:  in std_logic;
		sum									:	out std_logic_vector(3 downto 0);
		carry_out							:  out std_logic
	);
	end component;

	component digit_mux port (
		input_b, input_a					:  in std_logic_vector(3 downto 0);
		mux_select 							:	in std_logic;
		output  								:	out std_logic_vector(3 downto 0)
	);
	end component;


-- Create any signals, or temporary variables to be used
--
--  std_logic_vector is a signal which can be used for logic operations such as OR, AND, NOT, XOR
--
	signal seg7_A		: std_logic_vector(6 downto 0); -- signal for one seven segment display
	signal seg7_B		: std_logic_vector(6 downto 0); -- signal for one seven segment display

	signal hex_A		: std_logic_vector(3 downto 0); -- signal to represent hex number
	signal hex_B		: std_logic_vector(3 downto 0); -- signal to represent hex number

	signal pb			: std_logic_vector(3 downto 0); -- signal for push buttons

	signal sum			: std_logic_vector(3 downto 0); -- signal for resulting sum
	signal carry		: std_logic; -- signal for carry bit
	signal carry_acc  : std_logic_vector(3 downto 0); -- signal for final carry bit

	signal digit_1    : std_logic_vector(3 downto 0); -- signal for final digit to be displayed (MSB)
	signal digit_0    : std_logic_vector(3 downto 0); -- signal for final digit to be displayed (LSB)

-- Here the circuit begins

begin

	hex_A <= sw(3 downto 0);
	hex_B <= sw(7 downto 4);
	carry_acc <= "000" & carry;

	INST1: SevenSegment port map(digit_0, seg7_A); -- instance of seven segment display
	INST2: SevenSegment port map(digit_1, seg7_B); -- instance of seven segment display
	INST3: segment7_mux port map (clkin_50, seg7_A, seg7_B, seg7_data(6 downto 0), seg7_char2, seg7_char1); -- mappin ports for display
	INST4: PB_Inverters port map(pb_n, pb); -- mapping ports for push button inverters
	INST5: logic_processor port map(hex_B, hex_A, pb(1 downto 0), leds(3 downto 0)); -- mapping ports for logic processor
	INST6: full_adder_4bit port map(hex_B, hex_A, '0', sum, carry); -- mapping ports for adder
	INST7: digit_mux port map(hex_A, sum, pb(2), digit_0); -- mapping ports for multiplexer
	INST8: digit_mux port map(hex_B, carry_acc, pb(2), digit_1); -- mapping ports for multiplexer


end SimpleCircuit;

