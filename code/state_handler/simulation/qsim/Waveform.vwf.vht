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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "10/04/2021 16:39:27"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          state_handler
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY state_handler_vhd_vec_tst IS
END state_handler_vhd_vec_tst;
ARCHITECTURE state_handler_arch OF state_handler_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL IS_CORRECT_LETTER : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL LIFE : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL START : STD_LOGIC;
SIGNAL STATE_OUT : STD_LOGIC_VECTOR(2 DOWNTO 0);
COMPONENT state_handler
	PORT (
	CLK : IN STD_LOGIC;
	IS_CORRECT_LETTER : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	LIFE : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	START : IN STD_LOGIC;
	STATE_OUT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : state_handler
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	IS_CORRECT_LETTER => IS_CORRECT_LETTER,
	LIFE => LIFE,
	START => START,
	STATE_OUT => STATE_OUT
	);

-- CLK
t_prcs_CLK: PROCESS
BEGIN
LOOP
	CLK <= '0';
	WAIT FOR 10000 ps;
	CLK <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLK;

-- START
t_prcs_START: PROCESS
BEGIN
	START <= '0';
	WAIT FOR 30000 ps;
	START <= '1';
	WAIT FOR 30000 ps;
	START <= '0';
	WAIT FOR 230000 ps;
	START <= '1';
	WAIT FOR 60000 ps;
	START <= '0';
	WAIT FOR 280000 ps;
	START <= '1';
	WAIT FOR 50000 ps;
	START <= '0';
	WAIT FOR 240000 ps;
	START <= '1';
	WAIT FOR 10000 ps;
	START <= '0';
WAIT;
END PROCESS t_prcs_START;
-- IS_CORRECT_LETTER[1]
t_prcs_IS_CORRECT_LETTER_1: PROCESS
BEGIN
	IS_CORRECT_LETTER(1) <= '0';
	WAIT FOR 10000 ps;
	IS_CORRECT_LETTER(1) <= '1';
	WAIT FOR 10000 ps;
	IS_CORRECT_LETTER(1) <= '0';
	WAIT FOR 60000 ps;
	IS_CORRECT_LETTER(1) <= '1';
	WAIT FOR 10000 ps;
	IS_CORRECT_LETTER(1) <= '0';
	WAIT FOR 120000 ps;
	IS_CORRECT_LETTER(1) <= '1';
	WAIT FOR 10000 ps;
	IS_CORRECT_LETTER(1) <= '0';
	WAIT FOR 10000 ps;
	IS_CORRECT_LETTER(1) <= '1';
	WAIT FOR 10000 ps;
	IS_CORRECT_LETTER(1) <= '0';
	WAIT FOR 160000 ps;
	IS_CORRECT_LETTER(1) <= '1';
	WAIT FOR 10000 ps;
	IS_CORRECT_LETTER(1) <= '0';
	WAIT FOR 10000 ps;
	IS_CORRECT_LETTER(1) <= '1';
	WAIT FOR 10000 ps;
	IS_CORRECT_LETTER(1) <= '0';
	WAIT FOR 60000 ps;
	IS_CORRECT_LETTER(1) <= '1';
	WAIT FOR 20000 ps;
	IS_CORRECT_LETTER(1) <= '0';
	WAIT FOR 20000 ps;
	IS_CORRECT_LETTER(1) <= '1';
	WAIT FOR 20000 ps;
	IS_CORRECT_LETTER(1) <= '0';
	WAIT FOR 160000 ps;
	IS_CORRECT_LETTER(1) <= '1';
	WAIT FOR 20000 ps;
	IS_CORRECT_LETTER(1) <= '0';
	WAIT FOR 20000 ps;
	IS_CORRECT_LETTER(1) <= '1';
	WAIT FOR 20000 ps;
	IS_CORRECT_LETTER(1) <= '0';
	WAIT FOR 20000 ps;
	IS_CORRECT_LETTER(1) <= '1';
	WAIT FOR 20000 ps;
	IS_CORRECT_LETTER(1) <= '0';
	WAIT FOR 20000 ps;
	IS_CORRECT_LETTER(1) <= '1';
	WAIT FOR 20000 ps;
	IS_CORRECT_LETTER(1) <= '0';
	WAIT FOR 20000 ps;
	IS_CORRECT_LETTER(1) <= '1';
	WAIT FOR 20000 ps;
	IS_CORRECT_LETTER(1) <= '0';
WAIT;
END PROCESS t_prcs_IS_CORRECT_LETTER_1;
-- IS_CORRECT_LETTER[0]
t_prcs_IS_CORRECT_LETTER_0: PROCESS
BEGIN
	IS_CORRECT_LETTER(0) <= '0';
	WAIT FOR 40000 ps;
	IS_CORRECT_LETTER(0) <= '1';
	WAIT FOR 10000 ps;
	IS_CORRECT_LETTER(0) <= '0';
	WAIT FOR 80000 ps;
	IS_CORRECT_LETTER(0) <= '1';
	WAIT FOR 10000 ps;
	IS_CORRECT_LETTER(0) <= '0';
	WAIT FOR 10000 ps;
	IS_CORRECT_LETTER(0) <= '1';
	WAIT FOR 20000 ps;
	IS_CORRECT_LETTER(0) <= '0';
	WAIT FOR 20000 ps;
	IS_CORRECT_LETTER(0) <= '1';
	WAIT FOR 20000 ps;
	IS_CORRECT_LETTER(0) <= '0';
	WAIT FOR 150000 ps;
	IS_CORRECT_LETTER(0) <= '1';
	WAIT FOR 10000 ps;
	IS_CORRECT_LETTER(0) <= '0';
	WAIT FOR 10000 ps;
	IS_CORRECT_LETTER(0) <= '1';
	WAIT FOR 10000 ps;
	IS_CORRECT_LETTER(0) <= '0';
	WAIT FOR 50000 ps;
	IS_CORRECT_LETTER(0) <= '1';
	WAIT FOR 10000 ps;
	IS_CORRECT_LETTER(0) <= '0';
WAIT;
END PROCESS t_prcs_IS_CORRECT_LETTER_0;
END state_handler_arch;
