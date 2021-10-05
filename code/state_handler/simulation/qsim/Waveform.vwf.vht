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
-- Generated on "10/05/2021 10:57:10"
                                                             
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
SIGNAL LIFE : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL MASK : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL START : STD_LOGIC;
SIGNAL STATE_OUT : STD_LOGIC_VECTOR(2 DOWNTO 0);
COMPONENT state_handler
	PORT (
	CLK : IN STD_LOGIC;
	LIFE : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	MASK : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	START : IN STD_LOGIC;
	STATE_OUT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : state_handler
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	LIFE => LIFE,
	MASK => MASK,
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
	WAIT FOR 240000 ps;
	START <= '1';
	WAIT FOR 20000 ps;
	START <= '0';
	WAIT FOR 310000 ps;
	START <= '1';
	WAIT FOR 10000 ps;
	START <= '0';
WAIT;
END PROCESS t_prcs_START;
-- LIFE[1]
t_prcs_LIFE_1: PROCESS
BEGIN
	LIFE(1) <= '1';
	WAIT FOR 520000 ps;
	LIFE(1) <= '0';
	WAIT FOR 80000 ps;
	LIFE(1) <= '1';
WAIT;
END PROCESS t_prcs_LIFE_1;
-- LIFE[0]
t_prcs_LIFE_0: PROCESS
BEGIN
	LIFE(0) <= '1';
	WAIT FOR 520000 ps;
	LIFE(0) <= '0';
	WAIT FOR 80000 ps;
	LIFE(0) <= '1';
WAIT;
END PROCESS t_prcs_LIFE_0;
-- MASK[5]
t_prcs_MASK_5: PROCESS
BEGIN
	MASK(5) <= '0';
	WAIT FOR 170000 ps;
	MASK(5) <= '1';
	WAIT FOR 30000 ps;
	MASK(5) <= '0';
	WAIT FOR 110000 ps;
	MASK(5) <= '1';
	WAIT FOR 40000 ps;
	MASK(5) <= '0';
	WAIT FOR 50000 ps;
	MASK(5) <= '1';
	WAIT FOR 30000 ps;
	MASK(5) <= '0';
	WAIT FOR 110000 ps;
	MASK(5) <= '1';
	WAIT FOR 40000 ps;
	MASK(5) <= '0';
	WAIT FOR 170000 ps;
	MASK(5) <= '1';
WAIT;
END PROCESS t_prcs_MASK_5;
-- MASK[4]
t_prcs_MASK_4: PROCESS
BEGIN
	MASK(4) <= '0';
	WAIT FOR 130000 ps;
	MASK(4) <= '1';
	WAIT FOR 30000 ps;
	MASK(4) <= '0';
	WAIT FOR 100000 ps;
	MASK(4) <= '1';
	WAIT FOR 30000 ps;
	MASK(4) <= '0';
	WAIT FOR 110000 ps;
	MASK(4) <= '1';
	WAIT FOR 30000 ps;
	MASK(4) <= '0';
	WAIT FOR 30000 ps;
	MASK(4) <= '1';
	WAIT FOR 30000 ps;
	MASK(4) <= '0';
	WAIT FOR 230000 ps;
	MASK(4) <= '1';
WAIT;
END PROCESS t_prcs_MASK_4;
-- MASK[3]
t_prcs_MASK_3: PROCESS
BEGIN
	MASK(3) <= '0';
	WAIT FOR 100000 ps;
	MASK(3) <= '1';
	WAIT FOR 20000 ps;
	MASK(3) <= '0';
	WAIT FOR 140000 ps;
	MASK(3) <= '1';
	WAIT FOR 30000 ps;
	MASK(3) <= '0';
	WAIT FOR 110000 ps;
	MASK(3) <= '1';
	WAIT FOR 30000 ps;
	MASK(3) <= '0';
	WAIT FOR 30000 ps;
	MASK(3) <= '1';
	WAIT FOR 30000 ps;
	MASK(3) <= '0';
	WAIT FOR 200000 ps;
	MASK(3) <= '1';
WAIT;
END PROCESS t_prcs_MASK_3;
-- MASK[2]
t_prcs_MASK_2: PROCESS
BEGIN
	MASK(2) <= '0';
	WAIT FOR 10000 ps;
	MASK(2) <= '1';
	WAIT FOR 20000 ps;
	MASK(2) <= '0';
	WAIT FOR 200000 ps;
	MASK(2) <= '1';
	WAIT FOR 20000 ps;
	MASK(2) <= '0';
	WAIT FOR 210000 ps;
	MASK(2) <= '1';
	WAIT FOR 30000 ps;
	MASK(2) <= '0';
	WAIT FOR 50000 ps;
	MASK(2) <= '1';
	WAIT FOR 40000 ps;
	MASK(2) <= '0';
	WAIT FOR 50000 ps;
	MASK(2) <= '1';
WAIT;
END PROCESS t_prcs_MASK_2;
-- MASK[1]
t_prcs_MASK_1: PROCESS
BEGIN
	MASK(1) <= '0';
	WAIT FOR 40000 ps;
	MASK(1) <= '1';
	WAIT FOR 20000 ps;
	MASK(1) <= '0';
	WAIT FOR 170000 ps;
	MASK(1) <= '1';
	WAIT FOR 20000 ps;
	MASK(1) <= '0';
	WAIT FOR 60000 ps;
	MASK(1) <= '1';
	WAIT FOR 40000 ps;
	MASK(1) <= '0';
	WAIT FOR 190000 ps;
	MASK(1) <= '1';
	WAIT FOR 40000 ps;
	MASK(1) <= '0';
	WAIT FOR 80000 ps;
	MASK(1) <= '1';
WAIT;
END PROCESS t_prcs_MASK_1;
-- MASK[0]
t_prcs_MASK_0: PROCESS
BEGIN
	MASK(0) <= '0';
	WAIT FOR 10000 ps;
	MASK(0) <= '1';
	WAIT FOR 20000 ps;
	MASK(0) <= '0';
	WAIT FOR 200000 ps;
	MASK(0) <= '1';
	WAIT FOR 20000 ps;
	MASK(0) <= '0';
	WAIT FOR 210000 ps;
	MASK(0) <= '1';
	WAIT FOR 30000 ps;
	MASK(0) <= '0';
	WAIT FOR 140000 ps;
	MASK(0) <= '1';
WAIT;
END PROCESS t_prcs_MASK_0;
END state_handler_arch;
