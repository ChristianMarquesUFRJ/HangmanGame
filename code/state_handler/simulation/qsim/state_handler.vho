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

-- DATE "10/04/2021 16:39:29"

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
	IS_CORRECT_LETTER : IN std_logic_vector(1 DOWNTO 0);
	START : IN std_logic;
	CLK : IN std_logic;
	LIFE : OUT std_logic_vector(1 DOWNTO 0);
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
SIGNAL ww_IS_CORRECT_LETTER : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_START : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_LIFE : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_STATE_OUT : std_logic_vector(2 DOWNTO 0);
SIGNAL \LIFE[0]~output_o\ : std_logic;
SIGNAL \LIFE[1]~output_o\ : std_logic;
SIGNAL \STATE_OUT[0]~output_o\ : std_logic;
SIGNAL \STATE_OUT[1]~output_o\ : std_logic;
SIGNAL \STATE_OUT[2]~output_o\ : std_logic;
SIGNAL \IS_CORRECT_LETTER[0]~input_o\ : std_logic;
SIGNAL \update_life:life_counter[0]~0_combout\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \START~input_o\ : std_logic;
SIGNAL \IS_CORRECT_LETTER[1]~input_o\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \update_life:life_counter[1]~q\ : std_logic;
SIGNAL \current_state.Lose~2_combout\ : std_logic;
SIGNAL \current_state.Char0~0_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \next_state.Char4~5_combout\ : std_logic;
SIGNAL \next_state.Char0~q\ : std_logic;
SIGNAL \current_state.Char0~1_combout\ : std_logic;
SIGNAL \current_state.Char0~2_combout\ : std_logic;
SIGNAL \current_state.Char0~q\ : std_logic;
SIGNAL \next_state.Char2~1_combout\ : std_logic;
SIGNAL \next_state.Char1~1_combout\ : std_logic;
SIGNAL \next_state.Char1~q\ : std_logic;
SIGNAL \current_state.Char1~5_combout\ : std_logic;
SIGNAL \current_state.Char1~4_combout\ : std_logic;
SIGNAL \current_state.Char1~q\ : std_logic;
SIGNAL \next_state.Char4~3_combout\ : std_logic;
SIGNAL \next_state.Char3~3_combout\ : std_logic;
SIGNAL \next_state.Char3~q\ : std_logic;
SIGNAL \current_state.Char3~2_combout\ : std_logic;
SIGNAL \current_state.Char3~q\ : std_logic;
SIGNAL \change_state~9_combout\ : std_logic;
SIGNAL \next_state.Char2~2_combout\ : std_logic;
SIGNAL \next_state.Char2~q\ : std_logic;
SIGNAL \current_state.Char2~2_combout\ : std_logic;
SIGNAL \current_state.Char2~q\ : std_logic;
SIGNAL \STATE_OUT[2]~2_combout\ : std_logic;
SIGNAL \next_state.Win~5_combout\ : std_logic;
SIGNAL \next_state.Win~3_combout\ : std_logic;
SIGNAL \next_state.Char3~4_combout\ : std_logic;
SIGNAL \next_state.Win~4_combout\ : std_logic;
SIGNAL \next_state.Win~q\ : std_logic;
SIGNAL \current_state.Win~2_combout\ : std_logic;
SIGNAL \current_state.Win~q\ : std_logic;
SIGNAL \change_state~8_combout\ : std_logic;
SIGNAL \current_state.Lose~3_combout\ : std_logic;
SIGNAL \current_state.Lose~q\ : std_logic;
SIGNAL \current_state.Waiting~0_combout\ : std_logic;
SIGNAL \current_state.Waiting~q\ : std_logic;
SIGNAL \update_life:life_counter[0]~q\ : std_logic;
SIGNAL \next_state.Char4~4_combout\ : std_logic;
SIGNAL \next_state.Char4~q\ : std_logic;
SIGNAL \current_state.Char4~2_combout\ : std_logic;
SIGNAL \current_state.Char4~q\ : std_logic;
SIGNAL \STATE_OUT[0]~0_combout\ : std_logic;
SIGNAL \STATE_OUT[1]~1_combout\ : std_logic;
SIGNAL \ALT_INV_STATE_OUT[1]~1_combout\ : std_logic;
SIGNAL \ALT_INV_STATE_OUT[0]~0_combout\ : std_logic;
SIGNAL \ALT_INV_update_life:life_counter[0]~q\ : std_logic;
SIGNAL \ALT_INV_update_life:life_counter[1]~q\ : std_logic;
SIGNAL \ALT_INV_STATE_OUT[2]~2_combout\ : std_logic;

BEGIN

ww_IS_CORRECT_LETTER <= IS_CORRECT_LETTER;
ww_START <= START;
ww_CLK <= CLK;
LIFE <= ww_LIFE;
STATE_OUT <= ww_STATE_OUT;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_STATE_OUT[1]~1_combout\ <= NOT \STATE_OUT[1]~1_combout\;
\ALT_INV_STATE_OUT[0]~0_combout\ <= NOT \STATE_OUT[0]~0_combout\;
\ALT_INV_update_life:life_counter[0]~q\ <= NOT \update_life:life_counter[0]~q\;
\ALT_INV_update_life:life_counter[1]~q\ <= NOT \update_life:life_counter[1]~q\;
\ALT_INV_STATE_OUT[2]~2_combout\ <= NOT \STATE_OUT[2]~2_combout\;

\LIFE[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_update_life:life_counter[0]~q\,
	devoe => ww_devoe,
	o => \LIFE[0]~output_o\);

\LIFE[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_update_life:life_counter[1]~q\,
	devoe => ww_devoe,
	o => \LIFE[1]~output_o\);

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

\IS_CORRECT_LETTER[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IS_CORRECT_LETTER(0),
	o => \IS_CORRECT_LETTER[0]~input_o\);

\update_life:life_counter[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \update_life:life_counter[0]~0_combout\ = !\update_life:life_counter[0]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \update_life:life_counter[0]~q\,
	combout => \update_life:life_counter[0]~0_combout\);

\CLK~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

\START~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_START,
	o => \START~input_o\);

\IS_CORRECT_LETTER[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IS_CORRECT_LETTER(1),
	o => \IS_CORRECT_LETTER[1]~input_o\);

\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = \update_life:life_counter[0]~q\ $ (\update_life:life_counter[1]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \update_life:life_counter[0]~q\,
	datad => \update_life:life_counter[1]~q\,
	combout => \Add0~0_combout\);

\update_life:life_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \IS_CORRECT_LETTER[0]~input_o\,
	d => \Add0~0_combout\,
	clrn => \current_state.Waiting~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \update_life:life_counter[1]~q\);

\current_state.Lose~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.Lose~2_combout\ = (\update_life:life_counter[0]~q\ & (\update_life:life_counter[1]~q\ & \current_state.Waiting~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \update_life:life_counter[0]~q\,
	datab => \update_life:life_counter[1]~q\,
	datac => \current_state.Waiting~q\,
	combout => \current_state.Lose~2_combout\);

\current_state.Char0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.Char0~0_combout\ = (\current_state.Char0~q\ & ((!\update_life:life_counter[1]~q\) # (!\update_life:life_counter[0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Char0~q\,
	datac => \update_life:life_counter[0]~q\,
	datad => \update_life:life_counter[1]~q\,
	combout => \current_state.Char0~0_combout\);

\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (\IS_CORRECT_LETTER[1]~input_o\ & !\IS_CORRECT_LETTER[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IS_CORRECT_LETTER[1]~input_o\,
	datad => \IS_CORRECT_LETTER[0]~input_o\,
	combout => \Equal0~0_combout\);

\next_state.Char4~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Char4~5_combout\ = (\change_state~8_combout\) # ((\IS_CORRECT_LETTER[1]~input_o\ & (!\IS_CORRECT_LETTER[0]~input_o\ & \STATE_OUT[2]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IS_CORRECT_LETTER[1]~input_o\,
	datab => \IS_CORRECT_LETTER[0]~input_o\,
	datac => \STATE_OUT[2]~2_combout\,
	datad => \change_state~8_combout\,
	combout => \next_state.Char4~5_combout\);

\next_state.Char0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \current_state.Waiting~0_combout\,
	ena => \next_state.Char4~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.Char0~q\);

\current_state.Char0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.Char0~1_combout\ = (!\change_state~8_combout\ & ((\Equal0~0_combout\ & ((!\next_state.Char0~q\))) # (!\Equal0~0_combout\ & (\current_state.Char0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Char0~0_combout\,
	datab => \Equal0~0_combout\,
	datac => \next_state.Char0~q\,
	datad => \change_state~8_combout\,
	combout => \current_state.Char0~1_combout\);

\current_state.Char0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.Char0~2_combout\ = (\current_state.Char0~1_combout\) # ((\START~input_o\ & \change_state~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Char0~1_combout\,
	datab => \START~input_o\,
	datac => \change_state~8_combout\,
	combout => \current_state.Char0~2_combout\);

\current_state.Char0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \current_state.Char0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Char0~q\);

\next_state.Char2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Char2~1_combout\ = (\IS_CORRECT_LETTER[1]~input_o\ & ((\IS_CORRECT_LETTER[0]~input_o\ & (\next_state.Char2~q\)) # (!\IS_CORRECT_LETTER[0]~input_o\ & ((\current_state.Char0~q\))))) # (!\IS_CORRECT_LETTER[1]~input_o\ & (\next_state.Char2~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.Char2~q\,
	datab => \current_state.Char0~q\,
	datac => \IS_CORRECT_LETTER[1]~input_o\,
	datad => \IS_CORRECT_LETTER[0]~input_o\,
	combout => \next_state.Char2~1_combout\);

\next_state.Char1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Char1~1_combout\ = (\START~input_o\ & ((\current_state.Lose~q\) # ((\current_state.Win~q\) # (!\current_state.Waiting~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \START~input_o\,
	datab => \current_state.Lose~q\,
	datac => \current_state.Win~q\,
	datad => \current_state.Waiting~q\,
	combout => \next_state.Char1~1_combout\);

\next_state.Char1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \next_state.Char1~1_combout\,
	ena => \next_state.Char4~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.Char1~q\);

\current_state.Char1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.Char1~5_combout\ = (\IS_CORRECT_LETTER[1]~input_o\ & (!\IS_CORRECT_LETTER[0]~input_o\ & (\next_state.Char1~q\ & !\change_state~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IS_CORRECT_LETTER[1]~input_o\,
	datab => \IS_CORRECT_LETTER[0]~input_o\,
	datac => \next_state.Char1~q\,
	datad => \change_state~8_combout\,
	combout => \current_state.Char1~5_combout\);

\current_state.Char1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.Char1~4_combout\ = (\change_state~8_combout\) # ((\current_state.Lose~2_combout\) # ((\IS_CORRECT_LETTER[1]~input_o\ & !\IS_CORRECT_LETTER[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IS_CORRECT_LETTER[1]~input_o\,
	datab => \IS_CORRECT_LETTER[0]~input_o\,
	datac => \change_state~8_combout\,
	datad => \current_state.Lose~2_combout\,
	combout => \current_state.Char1~4_combout\);

\current_state.Char1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \current_state.Char1~5_combout\,
	ena => \current_state.Char1~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Char1~q\);

\next_state.Char4~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Char4~3_combout\ = (\Equal0~0_combout\ & (!\current_state.Char0~q\ & (!\change_state~9_combout\ & !\change_state~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \current_state.Char0~q\,
	datac => \change_state~9_combout\,
	datad => \change_state~8_combout\,
	combout => \next_state.Char4~3_combout\);

\next_state.Char3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Char3~3_combout\ = (\current_state.Char1~q\ & ((\next_state.Char4~3_combout\) # ((\next_state.Char3~q\ & !\next_state.Char4~5_combout\)))) # (!\current_state.Char1~q\ & (\next_state.Char3~q\ & (!\next_state.Char4~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Char1~q\,
	datab => \next_state.Char3~q\,
	datac => \next_state.Char4~5_combout\,
	datad => \next_state.Char4~3_combout\,
	combout => \next_state.Char3~3_combout\);

\next_state.Char3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \next_state.Char3~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.Char3~q\);

\current_state.Char3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.Char3~2_combout\ = (\IS_CORRECT_LETTER[1]~input_o\ & (!\IS_CORRECT_LETTER[0]~input_o\ & (\next_state.Char3~q\ & !\change_state~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IS_CORRECT_LETTER[1]~input_o\,
	datab => \IS_CORRECT_LETTER[0]~input_o\,
	datac => \next_state.Char3~q\,
	datad => \change_state~8_combout\,
	combout => \current_state.Char3~2_combout\);

\current_state.Char3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \current_state.Char3~2_combout\,
	ena => \current_state.Char1~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Char3~q\);

\change_state~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_state~9_combout\ = (!\current_state.Char2~q\ & (!\current_state.Char1~q\ & !\current_state.Char3~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.Char2~q\,
	datac => \current_state.Char1~q\,
	datad => \current_state.Char3~q\,
	combout => \change_state~9_combout\);

\next_state.Char2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Char2~2_combout\ = (!\change_state~8_combout\ & ((\next_state.Char2~1_combout\) # ((\change_state~9_combout\ & \next_state.Char2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.Char2~1_combout\,
	datab => \change_state~9_combout\,
	datac => \next_state.Char2~q\,
	datad => \change_state~8_combout\,
	combout => \next_state.Char2~2_combout\);

\next_state.Char2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \next_state.Char2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.Char2~q\);

\current_state.Char2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.Char2~2_combout\ = (\IS_CORRECT_LETTER[1]~input_o\ & (!\IS_CORRECT_LETTER[0]~input_o\ & (\next_state.Char2~q\ & !\change_state~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IS_CORRECT_LETTER[1]~input_o\,
	datab => \IS_CORRECT_LETTER[0]~input_o\,
	datac => \next_state.Char2~q\,
	datad => \change_state~8_combout\,
	combout => \current_state.Char2~2_combout\);

\current_state.Char2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \current_state.Char2~2_combout\,
	ena => \current_state.Char1~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Char2~q\);

\STATE_OUT[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \STATE_OUT[2]~2_combout\ = (\current_state.Char0~q\) # ((\current_state.Char2~q\) # ((\current_state.Char1~q\) # (\current_state.Char3~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Char0~q\,
	datab => \current_state.Char2~q\,
	datac => \current_state.Char1~q\,
	datad => \current_state.Char3~q\,
	combout => \STATE_OUT[2]~2_combout\);

\next_state.Win~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Win~5_combout\ = (\next_state.Win~q\ & (((\IS_CORRECT_LETTER[0]~input_o\) # (!\STATE_OUT[2]~2_combout\)) # (!\IS_CORRECT_LETTER[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IS_CORRECT_LETTER[1]~input_o\,
	datab => \IS_CORRECT_LETTER[0]~input_o\,
	datac => \next_state.Win~q\,
	datad => \STATE_OUT[2]~2_combout\,
	combout => \next_state.Win~5_combout\);

\next_state.Win~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Win~3_combout\ = (\IS_CORRECT_LETTER[0]~input_o\) # (((!\current_state.Char2~q\ & !\current_state.Char1~q\)) # (!\IS_CORRECT_LETTER[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IS_CORRECT_LETTER[0]~input_o\,
	datab => \current_state.Char2~q\,
	datac => \current_state.Char1~q\,
	datad => \IS_CORRECT_LETTER[1]~input_o\,
	combout => \next_state.Win~3_combout\);

\next_state.Char3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Char3~4_combout\ = ((\IS_CORRECT_LETTER[0]~input_o\) # ((\current_state.Char0~q\) # (\change_state~9_combout\))) # (!\IS_CORRECT_LETTER[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IS_CORRECT_LETTER[1]~input_o\,
	datab => \IS_CORRECT_LETTER[0]~input_o\,
	datac => \current_state.Char0~q\,
	datad => \change_state~9_combout\,
	combout => \next_state.Char3~4_combout\);

\next_state.Win~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Win~4_combout\ = (!\change_state~8_combout\ & ((\next_state.Win~5_combout\) # ((\next_state.Win~3_combout\ & !\next_state.Char3~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.Win~5_combout\,
	datab => \next_state.Win~3_combout\,
	datac => \next_state.Char3~4_combout\,
	datad => \change_state~8_combout\,
	combout => \next_state.Win~4_combout\);

\next_state.Win\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \next_state.Win~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.Win~q\);

\current_state.Win~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.Win~2_combout\ = (\IS_CORRECT_LETTER[1]~input_o\ & (!\IS_CORRECT_LETTER[0]~input_o\ & (\next_state.Win~q\ & !\change_state~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IS_CORRECT_LETTER[1]~input_o\,
	datab => \IS_CORRECT_LETTER[0]~input_o\,
	datac => \next_state.Win~q\,
	datad => \change_state~8_combout\,
	combout => \current_state.Win~2_combout\);

\current_state.Win\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \current_state.Win~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Win~q\);

\change_state~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_state~8_combout\ = (\current_state.Lose~q\) # ((\current_state.Win~q\) # (!\current_state.Waiting~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Lose~q\,
	datab => \current_state.Win~q\,
	datad => \current_state.Waiting~q\,
	combout => \change_state~8_combout\);

\current_state.Lose~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.Lose~3_combout\ = (\current_state.Lose~2_combout\ & (!\change_state~8_combout\ & ((\IS_CORRECT_LETTER[0]~input_o\) # (!\IS_CORRECT_LETTER[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IS_CORRECT_LETTER[1]~input_o\,
	datab => \IS_CORRECT_LETTER[0]~input_o\,
	datac => \current_state.Lose~2_combout\,
	datad => \change_state~8_combout\,
	combout => \current_state.Lose~3_combout\);

\current_state.Lose\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \current_state.Lose~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Lose~q\);

\current_state.Waiting~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.Waiting~0_combout\ = (\START~input_o\) # ((\current_state.Waiting~q\ & (!\current_state.Lose~q\ & !\current_state.Win~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \START~input_o\,
	datab => \current_state.Waiting~q\,
	datac => \current_state.Lose~q\,
	datad => \current_state.Win~q\,
	combout => \current_state.Waiting~0_combout\);

\current_state.Waiting\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \current_state.Waiting~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Waiting~q\);

\update_life:life_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \IS_CORRECT_LETTER[0]~input_o\,
	d => \update_life:life_counter[0]~0_combout\,
	clrn => \current_state.Waiting~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \update_life:life_counter[0]~q\);

\next_state.Char4~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.Char4~4_combout\ = (\current_state.Char2~q\ & ((\next_state.Char4~3_combout\) # ((\next_state.Char4~q\ & !\next_state.Char4~5_combout\)))) # (!\current_state.Char2~q\ & (\next_state.Char4~q\ & (!\next_state.Char4~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Char2~q\,
	datab => \next_state.Char4~q\,
	datac => \next_state.Char4~5_combout\,
	datad => \next_state.Char4~3_combout\,
	combout => \next_state.Char4~4_combout\);

\next_state.Char4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \next_state.Char4~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.Char4~q\);

\current_state.Char4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.Char4~2_combout\ = (\IS_CORRECT_LETTER[1]~input_o\ & (!\IS_CORRECT_LETTER[0]~input_o\ & (\next_state.Char4~q\ & !\change_state~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IS_CORRECT_LETTER[1]~input_o\,
	datab => \IS_CORRECT_LETTER[0]~input_o\,
	datac => \next_state.Char4~q\,
	datad => \change_state~8_combout\,
	combout => \current_state.Char4~2_combout\);

\current_state.Char4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \current_state.Char4~2_combout\,
	ena => \current_state.Char1~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Char4~q\);

\STATE_OUT[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \STATE_OUT[0]~0_combout\ = (\current_state.Char0~q\) # ((\current_state.Char4~q\) # ((\current_state.Char2~q\) # (\current_state.Lose~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Char0~q\,
	datab => \current_state.Char4~q\,
	datac => \current_state.Char2~q\,
	datad => \current_state.Lose~q\,
	combout => \STATE_OUT[0]~0_combout\);

\STATE_OUT[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \STATE_OUT[1]~1_combout\ = (\current_state.Char0~q\) # ((\current_state.Char4~q\) # ((\current_state.Char1~q\) # (\current_state.Win~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Char0~q\,
	datab => \current_state.Char4~q\,
	datac => \current_state.Char1~q\,
	datad => \current_state.Win~q\,
	combout => \STATE_OUT[1]~1_combout\);

ww_LIFE(0) <= \LIFE[0]~output_o\;

ww_LIFE(1) <= \LIFE[1]~output_o\;

ww_STATE_OUT(0) <= \STATE_OUT[0]~output_o\;

ww_STATE_OUT(1) <= \STATE_OUT[1]~output_o\;

ww_STATE_OUT(2) <= \STATE_OUT[2]~output_o\;
END structure;


