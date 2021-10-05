-- UNIVERSIDADE FEDERAL DO RIO DE JANEIRO - UFRJ
-- Autor: Christian Marques de Oliveira Silva
-- Disciplina: Laboratório de Sistemas Digitais
--
-- Objetivo: Controlar as acoes do jogo como um todo
--
--	Entradas: 	START, CLK, INPUT_LETTERS
--  Saidas:     DISPLAY_LETTER(1-6), DISPLAY_STATUS, LIFE_LEDS
-----------------------------------------------------------------------------------------------------

------------------------------------
-- Bibliotecas
------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
------------------------------------

------------------------------------
-- Entidade Principal
------------------------------------
entity hangman is
	port(
		START                   : 	in	std_logic;                      -- Comando para comecar o jogo
		CLK                     : 	in	std_logic;                      -- Sinal de atualizacao dos estados
        INPUT_LETTERS           :   in  std_logic_vector(15 downto 0);  -- Letras de entrada (0 a 15 => 0 a F)
        DISPLAY_LETTER1         :   out std_logic_vector(6 downto 0);   -- Display da 1a letra
        DISPLAY_LETTER2         :   out std_logic_vector(6 downto 0);   -- Display da 2a letra
        DISPLAY_LETTER3         :   out std_logic_vector(6 downto 0);   -- Display da 3a letra
        DISPLAY_LETTER4         :   out std_logic_vector(6 downto 0);   -- Display da 4a letra
        DISPLAY_LETTER5         :   out std_logic_vector(6 downto 0);   -- Display da 5a letra
        DISPLAY_LETTER6         :   out std_logic_vector(6 downto 0);   -- Display da 6a letra
        DISPLAY_STATUS          :   out std_logic_vector(6 downto 0);   -- Display do Status do JOGO ("", "P" ou "G")
        LIFE_LEDS               :   out std_logic_vector(2 downto 0)   -- LEDS que indicam a quantidade de vidas restante
    );	
end hangman;
------------------------------------

------------------------------------
-- Arquitetura Principal
------------------------------------
architecture hardware of hangman is

	-- Definicao do verificador de letras
	component letter_verification is
        port(
            KEYBOARD		    :	in	std_logic_vector(15 downto 0);  -- Teclado com todas as "letras" de 4 bits possiveis (de 0 a 15)
            START               : 	in	std_logic;                      -- Sinal de atualizacao dos estados
            CLK                 : 	in	std_logic;                      -- Sinal de atualizacao dos estados
            MASK		        :	out	std_logic_vector(5 downto 0);   -- Mascara que determina quais letras foram acertadas e serao exibidas
            LIFE                : 	out	std_logic_vector(1 downto 0)    -- Vida restante: 3 (completa) a 0 (perdeu o jogo)
        );
    end component;
    
	-- Definicao do manipulador de estados
	component state_handler is
        port(
            MASK		        :	in	std_logic_vector(5 downto 0);   -- Mascara que determina quais letras foram acertadas e serao exibidas
            LIFE                : 	in	std_logic_vector(1 downto 0);   -- Vida restante: 3 (completa) a 0 (perdeu o jogo)
            START               : 	in	std_logic;                      -- Comando para comecar o jogo
            CLK                 : 	in	std_logic;                      -- Sinal de atualizacao dos estados
            STATE_OUT           : 	out	std_logic_vector(2 downto 0)    -- Estado das palavras: 0-4 (N letras certas), 5 (win), 6 (lose) e 7 (waiting)
        );	
    end component;

	-- Definicao do display
	component display_7seg is 
        port(
            VALUE_IN	:	in	std_logic_vector(4 downto 0);	-- Codido de entrada para visualizacao (4=Oculto, 3-0=valores)
            CLK     	: 	in	std_logic;                      -- Sinal de atualizacao dos estados
            DISPLAY_OUT	:	out	std_logic_vector(6 downto 0)	-- Segmentos a serem acesos
        );
    end component;

    -- Variaveis
    -- Letras da palavra oculta
    CONSTANT letter6 : std_logic_vector(4 downto 0) := "01111";   -- 16 = "F"
    CONSTANT letter5 : std_logic_vector(4 downto 0) := "00000";   -- 0 =  "O"
    CONSTANT letter4 : std_logic_vector(4 downto 0) := "01100";   -- 12 = "C"
    CONSTANT letter3 : std_logic_vector(4 downto 0) := "01010";   -- 10 = "A"
    CONSTANT letter2 : std_logic_vector(4 downto 0) := "01101";   -- 13 = "D"
    CONSTANT letter1 : std_logic_vector(4 downto 0) := "01010";   -- 10 = "A"
    
    -- Constantes de status
    CONSTANT HIDDEN_LETTER  : std_logic_vector(4 downto 0) := "10000"; -- "-"
    CONSTANT WIN_GAME       : std_logic_vector(4 downto 0) := "10001"; -- "G"
    CONSTANT LOSE_GAME      : std_logic_vector(4 downto 0) := "10010"; -- "P"
    CONSTANT NOTHING        : std_logic_vector(4 downto 0) := "11111"; -- ""

    SIGNAL MASK : std_logic_vector(5 downto 0);   -- Mascara que determina quais letras foram acertadas e serao exibidas
    SIGNAL LIFE : std_logic_vector(1 downto 0);    -- Vida restante: 3 (completa) a 0 (perdeu o jogo)
    SIGNAL STATE: std_logic_vector(2 downto 0);   -- Estado das palavras: 0-4 (N letras certas), 5 (win), 6 (lose) e 7 (waiting)

    SIGNAL DISPLAY_LETTER_1 : std_logic_vector(4 downto 0) := NOTHING;
    SIGNAL DISPLAY_LETTER_2 : std_logic_vector(4 downto 0) := NOTHING;
    SIGNAL DISPLAY_LETTER_3 : std_logic_vector(4 downto 0) := NOTHING;
    SIGNAL DISPLAY_LETTER_4 : std_logic_vector(4 downto 0) := NOTHING;
    SIGNAL DISPLAY_LETTER_5 : std_logic_vector(4 downto 0) := NOTHING;
    SIGNAL DISPLAY_LETTER_6 : std_logic_vector(4 downto 0) := NOTHING;
    SIGNAL DISPLAY_STAT     : std_logic_vector(4 downto 0) := NOTHING;
    SIGNAL DISPLAY_LIFE     : std_logic_vector(1 downto 0) := "11";

begin


    letter_verification_comp: letter_verification PORT MAP(INPUT_LETTERS, START, CLK, MASK, LIFE);

    state_handler_comp: state_handler PORT MAP(MASK, LIFE, START, CLK, STATE);

    state_proc: PROCESS (CLK, STATE, LIFE, MASK)
    BEGIN
        DISPLAY_LIFE <= LIFE;

        IF ((STATE = "110")) THEN
            DISPLAY_STAT <= LOSE_GAME;

        ELSIF((STATE = "101")) THEN
            DISPLAY_STAT <= WIN_GAME;

        ELSE
            DISPLAY_STAT <= NOTHING;

            -- Esperando
            IF((STATE = "111")) THEN
                DISPLAY_LETTER_1 <= NOTHING;
                DISPLAY_LETTER_2 <= NOTHING;
                DISPLAY_LETTER_3 <= NOTHING;
                DISPLAY_LETTER_4 <= NOTHING;
                DISPLAY_LETTER_5 <= NOTHING;
                DISPLAY_LETTER_6 <= NOTHING;

            ELSE
                IF (MASK(5) = '1') THEN DISPLAY_LETTER_6 <= letter6; ELSE DISPLAY_LETTER_6 <= HIDDEN_LETTER; END IF;

                IF (MASK(4) = '1') THEN DISPLAY_LETTER_5 <= letter5; ELSE DISPLAY_LETTER_5 <= HIDDEN_LETTER; END IF;

                IF (MASK(3) = '1') THEN DISPLAY_LETTER_4 <= letter5; ELSE DISPLAY_LETTER_4 <= HIDDEN_LETTER; END IF;

                IF (MASK(2) = '1') THEN DISPLAY_LETTER_3 <= letter5; ELSE DISPLAY_LETTER_3 <= HIDDEN_LETTER; END IF;

                IF (MASK(1) = '1') THEN DISPLAY_LETTER_2 <= letter5; ELSE DISPLAY_LETTER_2 <= HIDDEN_LETTER; END IF;

                IF (MASK(0) = '1') THEN DISPLAY_LETTER_1 <= letter5; ELSE DISPLAY_LETTER_1 <= HIDDEN_LETTER; END IF;
            END IF;
        END IF;
    END PROCESS state_proc;


    display6_comp: display_7seg PORT MAP(DISPLAY_LETTER_6, CLK, DISPLAY_LETTER6);
    display5_comp: display_7seg PORT MAP(DISPLAY_LETTER_5, CLK, DISPLAY_LETTER5);
    display4_comp: display_7seg PORT MAP(DISPLAY_LETTER_4, CLK, DISPLAY_LETTER4);
    display3_comp: display_7seg PORT MAP(DISPLAY_LETTER_3, CLK, DISPLAY_LETTER3);
    display2_comp: display_7seg PORT MAP(DISPLAY_LETTER_2, CLK, DISPLAY_LETTER2);
    display1_comp: display_7seg PORT MAP(DISPLAY_LETTER_1, CLK, DISPLAY_LETTER1);
    
    display_status_comp: display_7seg PORT MAP(DISPLAY_STAT, CLK, DISPLAY_STATUS);

    LIFE_LEDS <=    "000" when DISPLAY_LIFE = "00" else 
                    "001" when DISPLAY_LIFE = "01" else 
                    "011" when DISPLAY_LIFE = "10" else 
                    "111" when DISPLAY_LIFE = "11";

end hardware;
------------------------------------