-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "10/19/2021 22:20:18"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	state_handler IS
    PORT (
	MASK : IN std_logic_vector(5 DOWNTO 0);
	LIFE : IN std_logic_vector(1 DOWNTO 0);
	START : IN std_logic;
	CLK : IN std_logic;
	STATE_OUT : OUT std_logic_vector(2 DOWNTO 0)
	);
END state_handler;

ARCHITECTURE structure OF state_handler IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_MASK : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_LIFE : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_START : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_STATE_OUT : std_logic_vector(2 DOWNTO 0);
SIGNAL \MASK[0]~input_o\ : std_logic;
SIGNAL \STATE_OUT[0]~output_o\ : std_logic;
SIGNAL \STATE_OUT[1]~output_o\ : std_logic;
SIGNAL \STATE_OUT[2]~output_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \MASK[5]~input_o\ : std_logic;
SIGNAL \MASK[1]~input_o\ : std_logic;
SIGNAL \MASK[2]~input_o\ : std_logic;
SIGNAL \MASK[3]~input_o\ : std_logic;
SIGNAL \MASK[4]~input_o\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \letters~0_combout\ : std_logic;
SIGNAL \START~input_o\ : std_logic;
SIGNAL \letters~1_combout\ : std_logic;
SIGNAL \letters~2_combout\ : std_logic;
SIGNAL \letters~3_combout\ : std_logic;
SIGNAL \letters~4_combout\ : std_logic;
SIGNAL \change_state~13_combout\ : std_logic;
SIGNAL \next_state.Char4~1_combout\ : std_logic;
SIGNAL \change_state~14_combout\ : std_logic;
SIGNAL \next_state.Char3~1_combout\ : std_logic;
SIGNAL \next_state.Char3~2_combout\ : std_logic;
SIGNAL \next_state.Char3~q\ : std_logic;
SIGNAL \current_state.Char3~1_combout\ : std_logic;
SIGNAL \LIFE[0]~input_o\ : std_logic;
SIGNAL \LIFE[1]~input_o\ : std_logic;
SIGNAL \change_state~12_combout\ : std_logic;
SIGNAL \current_state.Char0~0_combout\ : std_logic;
SIGNAL \current_state.Char3~q\ : std_logic;
SIGNAL \change_state~9_combout\ : std_logic;
SIGNAL \next_state.Char1~2_combout\ : std_logic;
SIGNAL \next_state.Char4~2_combout\ : std_logic;
SIGNAL \next_state.Char4~q\ : std_logic;
SIGNAL \current_state.Char4~0_combout\ : std_logic;
SIGNAL \current_state.Char4~q\ : std_logic;
SIGNAL \change_state~8_combout\ : std_logic;
SIGNAL \next_state.Char1~3_combout\ : std_logic;
SIGNAL \next_state.Char1~q\ : std_logic;
SIGNAL \current_state.Char1~0_combout\ : std_logic;
SIGNAL \current_state.Char1~q\ : std_logic;
SIGNAL \next_state.Char2~1_combout\ : std_logic;
SIGNAL \next_state.Char2~2_combout\ : std_logic;
SIGNAL \next_state.Char1~1_combout\ : std_logic;
SIGNAL \current_state.Lose~0_combout\ : std_logic;
SIGNAL \current_state.Lose~1_combout\ : std_logic;
SIGNAL \current_state.Lose~q\ : std_logic;
SIGNAL \current_state.Char3~0_combout\ : std_logic;
SIGNAL \next_state.Char2~4_combout\ : std_logic;
SIGNAL \next_state.Win~1_combout\ : std_logic;
SIGNAL \next_state.Win~q\ : std_logic;
SIGNAL \current_state.Win~0_combout\ : std_logic;
SIGNAL \current_state.Win~q\ : std_logic;
SIGNAL \change_state~11_combout\ : std_logic;
SIGNAL \current_state.Char0~q\ : std_logic;
SIGNAL \change_state~10_combout\ : std_logic;
SIGNAL \next_state.Char2~3_combout\ : std_logic;
SIGNAL \next_state.Char2~q\ : std_logic;
SIGNAL \current_state.Char2~0_combout\ : std_logic;
SIGNAL \current_state.Char2~q\ : std_logic;
SIGNAL \STATE_OUT[0]~0_combout\ : std_logic;
SIGNAL \STATE_OUT[1]~1_combout\ : std_logic;
SIGNAL \STATE_OUT[2]~2_combout\ : std_logic;
SIGNAL \ALT_INV_STATE_OUT[1]~1_combout\ : std_logic;
SIGNAL \ALT_INV_STATE_OUT[2]~2_combout\ : std_logic;
SIGNAL \ALT_INV_STATE_OUT[0]~0_combout\ : std_logic;

BEGIN

ww_MASK <= MASK;
ww_LIFE <= LIFE;
ww_START <= START;
ww_CLK <= CLK;
STATE_OUT <= ww_STATE_OUT;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_STATE_OUT[1]~1_combout\ <= NOT \STATE_OUT[1]~1_combout\;
\ALT_INV_STATE_OUT[2]~2_combout\ <= NOT \STATE_OUT[2]~2_combout\;
\ALT_INV_STATE_OUT[0]~0_combout\ <= NOT \STATE_OUT[0]~0_combout\;

\STATE_OUT[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_STATE_OUT[0]~0_combout\,
	devoe => ww_devoe,
	o => \STATE_OUT[0]~output_o\);

\STATE_OUT[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_STATE_OUT[1]~1_combout\,
	devoe => ww_devoe,
	o => \STATE_OUT[1]~output_o\);

\STATE_OUT[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_STATE_OUT[2]~2_combout\,
	devoe => ww_devoe,
	o => \STATE_OUT[2]~output_o\);

\CLK~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

\MASK[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_MASK(5),
	o => \MASK[5]~input_o\);

\MASK[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_MASK(1),
	o => \MASK[1]~input_o\);

\MASK[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_MASK(2),
	o => \MASK[2]~input_o\);

\MASK[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_MASK(3),
	o => \MASK[3]~input_o\);

\MASK[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_MASK(4),
	o => \MASK[4]~input_o\);

\Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = \MASK[1]~input_o\ $ (\MASK[2]~input_o\ $ (\MASK[3]~input_o\ $ (\MASK[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MASK[1]~input_o\,
	datab => \MASK[2]~input_o\,
	datac => \MASK[3]~input_o\,
	datad => \MASK[4]~input_o\,
	combout => \Add1~0_combout\);

\letters~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \letters~0_combout\ = \MASK[5]~input_o\ $ (\Add1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MASK[5]~input_o\,
	datad => \Add1~0_combout\,
	combout => \letters~0_combout\);

\START~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_START,
	o => \START~input_o\);

\letters~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \letters~1_combout\ = (\MASK[1]~input_o\ & (\MASK[2]~input_o\ & (\MASK[3]~input_o\ & \MASK[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MASK[1]~input_o\,
	datab => \MASK[2]~input_o\,
	datac => \MASK[3]~input_o\,
	datad => \MASK[4]~input_o\,
	combout => \letters~1_combout\);

\letters~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \letters~2_combout\ = (\MASK[1]~input_o\ & ((\MASK[2]~input_o\ & ((!\MASK[4]~input_o\) # (!\MASK[3]~input_o\))) # (!\MASK[2]~input_o\ & ((\MASK[3]~input_o\) # (\MASK[4]~input_o\))))) # (!\MASK[1]~input_o\ & ((\MASK[2]~input_o\ & ((\MASK[3]~input_o\) # 
-- (\MASK[4]~input_o\))) # (!\MASK[2]~input_o\ & (\MASK[3]~input_o\ & \MASK[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MASK[1]~input_o\,
	datab => \MASK[2]~input_o\,
	datac => \MASK[3]~input_o\,
	datad => \MASK[4]~input_o\,
	combout => \letters~2_combout\);

\letters~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \letters~3_combout\ = (\letters~1_combout\) # ((\MASK[5]~input_o\ & (\Add1~0_combout\ & \letters~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \letters~1_combout\,
	datab => \MASK[5]~input_o\,
	datac => \Add1~0_combout\,
	datad => \letters~2_combout\,
	combout => \letters~3_combout\);

\letters~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \letters~4_combout\ = \letters~2_combout\ $ (((\MASK[5]~input_o\ & \Add1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \letters~2_combout\,
	datac => \MASK[5]~input_o\,
	datad => \Add1~0_combout\,
	combout => \letters~4_combout\);

\change_state~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_state~13_combout\ = (\current_state.Char2~q\ & (\MASK[5]~input_o\ $ (\Add1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Char2~q\,
	datac => \MASK[5]~input_o\,
	datad => \Add1~0_combout\,
	combout => \change_state~13_combout\);

\next_state.Char4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Char4~1_combout\ = (\letters~4_combout\ & (\change_state~13_combout\ & (\change_state~11_combout\ & !\letters~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \letters~4_combout\,
	datab => \change_state~13_combout\,
	datac => \change_state~11_combout\,
	datad => \letters~3_combout\,
	combout => \next_state.Char4~1_combout\);

\change_state~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_state~14_combout\ = (\current_state.Char1~q\ & (\MASK[5]~input_o\ $ (!\Add1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001010000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Char1~q\,
	datab => \MASK[5]~input_o\,
	datac => \Add1~0_combout\,
	combout => \change_state~14_combout\);

\next_state.Char3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Char3~1_combout\ = (\letters~4_combout\ & (\change_state~14_combout\ & (\change_state~11_combout\ & !\letters~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \letters~4_combout\,
	datab => \change_state~14_combout\,
	datac => \change_state~11_combout\,
	datad => \letters~3_combout\,
	combout => \next_state.Char3~1_combout\);

\next_state.Char3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Char3~2_combout\ = (\next_state.Char3~1_combout\) # ((\next_state.Char3~q\ & !\next_state.Char1~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.Char3~1_combout\,
	datab => \next_state.Char3~q\,
	datad => \next_state.Char1~2_combout\,
	combout => \next_state.Char3~2_combout\);

\next_state.Char3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \next_state.Char3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.Char3~q\);

\current_state.Char3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.Char3~1_combout\ = (\next_state.Char3~q\ & (\change_state~11_combout\ & ((\change_state~8_combout\) # (!\next_state.Char1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.Char3~q\,
	datab => \change_state~8_combout\,
	datac => \next_state.Char1~1_combout\,
	datad => \change_state~11_combout\,
	combout => \current_state.Char3~1_combout\);

\LIFE[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_LIFE(0),
	o => \LIFE[0]~input_o\);

\LIFE[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_LIFE(1),
	o => \LIFE[1]~input_o\);

\change_state~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_state~12_combout\ = (!\LIFE[0]~input_o\ & !\LIFE[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \LIFE[0]~input_o\,
	datad => \LIFE[1]~input_o\,
	combout => \change_state~12_combout\);

\current_state.Char0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.Char0~0_combout\ = ((\change_state~12_combout\) # ((\change_state~8_combout\) # (!\next_state.Char1~1_combout\))) # (!\change_state~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_state~11_combout\,
	datab => \change_state~12_combout\,
	datac => \change_state~8_combout\,
	datad => \next_state.Char1~1_combout\,
	combout => \current_state.Char0~0_combout\);

\current_state.Char3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \current_state.Char3~1_combout\,
	ena => \current_state.Char0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Char3~q\);

\change_state~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_state~9_combout\ = (\current_state.Char3~q\ & (\letters~3_combout\ & (!\letters~0_combout\ & !\letters~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Char3~q\,
	datab => \letters~3_combout\,
	datac => \letters~0_combout\,
	datad => \letters~4_combout\,
	combout => \change_state~9_combout\);

\next_state.Char1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Char1~2_combout\ = ((\change_state~9_combout\) # ((\change_state~10_combout\) # (!\next_state.Char2~2_combout\))) # (!\change_state~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_state~11_combout\,
	datab => \change_state~9_combout\,
	datac => \change_state~10_combout\,
	datad => \next_state.Char2~2_combout\,
	combout => \next_state.Char1~2_combout\);

\next_state.Char4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Char4~2_combout\ = (\next_state.Char4~1_combout\) # ((\next_state.Char4~q\ & !\next_state.Char1~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.Char4~1_combout\,
	datab => \next_state.Char4~q\,
	datad => \next_state.Char1~2_combout\,
	combout => \next_state.Char4~2_combout\);

\next_state.Char4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \next_state.Char4~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.Char4~q\);

\current_state.Char4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.Char4~0_combout\ = (\next_state.Char4~q\ & (\change_state~11_combout\ & ((\change_state~8_combout\) # (!\next_state.Char1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.Char4~q\,
	datab => \change_state~8_combout\,
	datac => \next_state.Char1~1_combout\,
	datad => \change_state~11_combout\,
	combout => \current_state.Char4~0_combout\);

\current_state.Char4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \current_state.Char4~0_combout\,
	ena => \current_state.Char0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Char4~q\);

\change_state~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_state~8_combout\ = (\current_state.Char4~q\ & (\letters~0_combout\ & (\letters~3_combout\ & !\letters~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Char4~q\,
	datab => \letters~0_combout\,
	datac => \letters~3_combout\,
	datad => \letters~4_combout\,
	combout => \change_state~8_combout\);

\next_state.Char1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Char1~3_combout\ = (\change_state~11_combout\ & ((\next_state.Char1~q\) # (!\next_state.Char1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_state~11_combout\,
	datab => \next_state.Char1~1_combout\,
	datad => \next_state.Char1~q\,
	combout => \next_state.Char1~3_combout\);

\next_state.Char1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \next_state.Char1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.Char1~q\);

\current_state.Char1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.Char1~0_combout\ = (\change_state~11_combout\ & (!\next_state.Char1~q\ & ((\change_state~8_combout\) # (!\next_state.Char1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_state~8_combout\,
	datab => \next_state.Char1~1_combout\,
	datac => \change_state~11_combout\,
	datad => \next_state.Char1~q\,
	combout => \current_state.Char1~0_combout\);

\current_state.Char1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \current_state.Char1~0_combout\,
	ena => \current_state.Char0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Char1~q\);

\next_state.Char2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Char2~1_combout\ = (\MASK[5]~input_o\ & ((\Add1~0_combout\ & (\current_state.Char1~q\)) # (!\Add1~0_combout\ & ((\current_state.Char2~q\))))) # (!\MASK[5]~input_o\ & ((\Add1~0_combout\ & ((\current_state.Char2~q\))) # (!\Add1~0_combout\ & 
-- (\current_state.Char1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011010010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MASK[5]~input_o\,
	datab => \Add1~0_combout\,
	datac => \current_state.Char1~q\,
	datad => \current_state.Char2~q\,
	combout => \next_state.Char2~1_combout\);

\next_state.Char2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Char2~2_combout\ = (\letters~3_combout\) # ((!\next_state.Char2~1_combout\) # (!\letters~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \letters~3_combout\,
	datab => \letters~4_combout\,
	datac => \next_state.Char2~1_combout\,
	combout => \next_state.Char2~2_combout\);

\next_state.Char1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Char1~1_combout\ = (\next_state.Char2~2_combout\ & (!\change_state~9_combout\ & !\change_state~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.Char2~2_combout\,
	datac => \change_state~9_combout\,
	datad => \change_state~10_combout\,
	combout => \next_state.Char1~1_combout\);

\current_state.Lose~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.Lose~0_combout\ = (\current_state.Lose~q\) # ((!\LIFE[0]~input_o\ & !\LIFE[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Lose~q\,
	datac => \LIFE[0]~input_o\,
	datad => \LIFE[1]~input_o\,
	combout => \current_state.Lose~0_combout\);

\current_state.Lose~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.Lose~1_combout\ = (\next_state.Char1~1_combout\ & (\current_state.Lose~0_combout\ & (\change_state~11_combout\ & !\change_state~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.Char1~1_combout\,
	datab => \current_state.Lose~0_combout\,
	datac => \change_state~11_combout\,
	datad => \change_state~8_combout\,
	combout => \current_state.Lose~1_combout\);

\current_state.Lose\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \current_state.Lose~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Lose~q\);

\current_state.Char3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.Char3~0_combout\ = (\change_state~11_combout\ & ((\change_state~8_combout\) # (!\next_state.Char1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_state~8_combout\,
	datac => \next_state.Char1~1_combout\,
	datad => \change_state~11_combout\,
	combout => \current_state.Char3~0_combout\);

\next_state.Char2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Char2~4_combout\ = (\next_state.Char2~2_combout\ & (\change_state~11_combout\ & !\change_state~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.Char2~2_combout\,
	datac => \change_state~11_combout\,
	datad => \change_state~10_combout\,
	combout => \next_state.Char2~4_combout\);

\next_state.Win~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Win~1_combout\ = (\next_state.Char1~2_combout\ & (\next_state.Char2~4_combout\)) # (!\next_state.Char1~2_combout\ & ((\next_state.Win~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.Char2~4_combout\,
	datab => \next_state.Win~q\,
	datad => \next_state.Char1~2_combout\,
	combout => \next_state.Win~1_combout\);

\next_state.Win\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \next_state.Win~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.Win~q\);

\current_state.Win~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.Win~0_combout\ = (\current_state.Char3~0_combout\ & ((\next_state.Win~q\) # ((\current_state.Win~q\ & !\current_state.Char0~0_combout\)))) # (!\current_state.Char3~0_combout\ & (((\current_state.Win~q\ & !\current_state.Char0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Char3~0_combout\,
	datab => \next_state.Win~q\,
	datac => \current_state.Win~q\,
	datad => \current_state.Char0~0_combout\,
	combout => \current_state.Win~0_combout\);

\current_state.Win\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \current_state.Win~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Win~q\);

\change_state~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_state~11_combout\ = ((!\current_state.Lose~q\ & !\current_state.Win~q\)) # (!\START~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \START~input_o\,
	datab => \current_state.Lose~q\,
	datac => \current_state.Win~q\,
	combout => \change_state~11_combout\);

\current_state.Char0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \change_state~11_combout\,
	ena => \current_state.Char0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Char0~q\);

\change_state~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_state~10_combout\ = (\letters~0_combout\ & (!\current_state.Char0~q\ & (!\letters~3_combout\ & !\letters~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \letters~0_combout\,
	datab => \current_state.Char0~q\,
	datac => \letters~3_combout\,
	datad => \letters~4_combout\,
	combout => \change_state~10_combout\);

\next_state.Char2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Char2~3_combout\ = (\change_state~10_combout\ & ((\change_state~11_combout\) # ((\next_state.Char2~q\ & !\next_state.Char1~2_combout\)))) # (!\change_state~10_combout\ & (\next_state.Char2~q\ & ((!\next_state.Char1~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_state~10_combout\,
	datab => \next_state.Char2~q\,
	datac => \change_state~11_combout\,
	datad => \next_state.Char1~2_combout\,
	combout => \next_state.Char2~3_combout\);

\next_state.Char2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \next_state.Char2~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.Char2~q\);

\current_state.Char2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.Char2~0_combout\ = (\next_state.Char2~q\ & (\change_state~11_combout\ & ((\change_state~8_combout\) # (!\next_state.Char1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.Char2~q\,
	datab => \change_state~8_combout\,
	datac => \next_state.Char1~1_combout\,
	datad => \change_state~11_combout\,
	combout => \current_state.Char2~0_combout\);

\current_state.Char2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \current_state.Char2~0_combout\,
	ena => \current_state.Char0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Char2~q\);

\STATE_OUT[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \STATE_OUT[0]~0_combout\ = (\current_state.Char2~q\) # ((\current_state.Char4~q\) # ((\current_state.Lose~q\) # (!\current_state.Char0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Char2~q\,
	datab => \current_state.Char4~q\,
	datac => \current_state.Lose~q\,
	datad => \current_state.Char0~q\,
	combout => \STATE_OUT[0]~0_combout\);

\STATE_OUT[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \STATE_OUT[1]~1_combout\ = (\current_state.Char4~q\) # ((\current_state.Char1~q\) # ((\current_state.Win~q\) # (!\current_state.Char0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Char4~q\,
	datab => \current_state.Char1~q\,
	datac => \current_state.Win~q\,
	datad => \current_state.Char0~q\,
	combout => \STATE_OUT[1]~1_combout\);

\STATE_OUT[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \STATE_OUT[2]~2_combout\ = (\current_state.Char2~q\) # ((\current_state.Char1~q\) # ((\current_state.Char3~q\) # (!\current_state.Char0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Char2~q\,
	datab => \current_state.Char1~q\,
	datac => \current_state.Char3~q\,
	datad => \current_state.Char0~q\,
	combout => \STATE_OUT[2]~2_combout\);

\MASK[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_MASK(0),
	o => \MASK[0]~input_o\);

ww_STATE_OUT(0) <= \STATE_OUT[0]~output_o\;

ww_STATE_OUT(1) <= \STATE_OUT[1]~output_o\;

ww_STATE_OUT(2) <= \STATE_OUT[2]~output_o\;
END structure;


