-- UNIVERSIDADE FEDERAL DO RIO DE JANEIRO - UFRJ
-- Autor: Christian Marques de Oliveira Silva
-- Disciplina: Laboratório de Sistemas Digitais
--
-- Objetivo: Manipular os estados do sistema baseado no estado atual e nas entradas
--
--	Entradas: 	MASK, LIFE, START, CLK
--  Saidas:     STATE_OUT
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
entity state_handler is
	port(
		MASK		        :	in	std_logic_vector(5 downto 0);   -- Mascara que determina quais letras foram acertadas e serao exibidas
		LIFE                : 	in	std_logic_vector(1 downto 0);   -- Vida restante: 3 (completa) a 0 (perdeu o jogo)
		START               : 	in	std_logic;                      -- Comando para comecar o jogo
		CLK                 : 	in	std_logic;                      -- Sinal de atualizacao dos estados
		STATE_OUT           : 	out	std_logic_vector(2 downto 0)    -- Estado das palavras: 0-4 (N letras certas), 5 (win), 6 (lose) e 7 (waiting)
    );	
end state_handler;
------------------------------------

------------------------------------
-- Arquitetura Principal
------------------------------------
architecture hardware of state_handler is
    -- Criacao dos estados
    TYPE GAME_STATE IS (Waiting, Char0, Char1, Char2, Char3, Char4, Win, Lose);
    SIGNAL current_state: GAME_STATE := Waiting;
    SIGNAL next_state: GAME_STATE := Char0;

    -- Funcao para obter a quantidade de letras diferentes situadas na mascara
    FUNCTION GET_NUMBER_VALID_LETTERS (MASK_INPUT : in std_logic_vector) return std_logic_vector is
        VARIABLE letters : std_logic_vector(2 downto 0) := "000";
    BEGIN
        FOR index IN 1 TO MASK_INPUT'length-1 LOOP
            IF (MASK_INPUT(index) = '1') THEN
                letters := letters + 1;
            END IF;
        END LOOP;

        RETURN letters;
        
    END FUNCTION GET_NUMBER_VALID_LETTERS;

begin

    -- Transicao de estados
    change_state: PROCESS (START, MASK, CLK)
    BEGIN
        -- Se finalizou o jogo ou esta aguardando o start, o estado atual deve ser o de espera 
        IF (((current_state = Waiting) or (current_state = Win) or (current_state = Lose)) and (START = '0') and rising_edge(CLK)) THEN
            current_state   <= Waiting;
            next_state      <= Char0;

        -- Caso esteja em espera e receba o comando de start, o estado atual passa a ser o de CHAR_0 e o proximo CHAR_1
        ELSIF (((current_state = Waiting) or (current_state = Win) or (current_state = Lose)) and (START = '1') and rising_edge(CLK)) THEN
            current_state   <= Char0;
            next_state      <= Char1;

        -- Caso esteja em CHAR_0 e possua 1 letra valida na mascara, o estado atual passa a ser o de CHAR_1 e o proximo CHAR_2
        ELSIF ((current_state = Char0) and (GET_NUMBER_VALID_LETTERS(MASK) = "001") and rising_edge(CLK)) THEN
            current_state   <= next_state;
            next_state      <= Char2;
        
        -- Caso esteja em CHAR_1 e possua 2 letras validas na mascara, o estado atual passa a ser o de CHAR_2 e o proximo CHAR_3
        ELSIF ((current_state = Char1) and (GET_NUMBER_VALID_LETTERS(MASK) = "010") and rising_edge(CLK)) THEN
            current_state   <= next_state;
            next_state      <= Char3;
        
        -- Caso esteja em CHAR_2 e possua 3 letras validas na mascara, o estado atual passa a ser o de CHAR_3 e o proximo CHAR_4
        ELSIF ((current_state = Char2) and (GET_NUMBER_VALID_LETTERS(MASK) = "011") and rising_edge(CLK)) THEN
            current_state   <= next_state;
            next_state      <= Char4;
        
        -- Caso esteja em CHAR_3 e possua 4 letras validas na mascara, o estado atual passa a ser o de CHAR_4 e o proximo WIN
        ELSIF ((current_state = Char3) and (GET_NUMBER_VALID_LETTERS(MASK) = "100") and rising_edge(CLK)) THEN
            current_state   <= next_state;
            next_state      <= Win;
        
        -- Caso esteja em CHAR_4 e possua 5 letras validas na mascara, o estado atual passa a ser o de WIN
        ELSIF ((current_state = Char4) and (GET_NUMBER_VALID_LETTERS(MASK) = "101") and rising_edge(CLK)) THEN
            current_state   <= next_state;
        
        -- Caso nao esteja no modo espera e nao houver mais vida restante, o estado atual passa a ser o de LOSE
        ELSIF ((current_state /= Waiting) and (LIFE = 0) and rising_edge(CLK)) THEN
            current_state   <= Lose;

        -- Mantem os estados atuais
        ELSE
            current_state   <= current_state;
            next_state      <= next_state;

        END IF;

    END PROCESS change_state;

    -- Atuacao das saidas a partir do estado
    output_update: PROCESS (current_state)
    BEGIN

        -- 1 conjunto de letras diferentes descoberta
        IF ((current_state = Char0)) THEN STATE_OUT <= "000";

        -- 2 conjuntos de letras diferentes descobertas
        ELSIF ((current_state = Char1)) THEN STATE_OUT <= "001";
            
        -- 2 conjuntos de letras diferentes descobertas
        ELSIF ((current_state = Char2)) THEN STATE_OUT <= "010";

        -- 3 conjuntos de letras diferentes descobertas
        ELSIF ((current_state = Char3)) THEN STATE_OUT <= "011";

        -- 4 conjuntos de letras diferentes descobertas
        ELSIF ((current_state = Char4)) THEN STATE_OUT <= "100";

        -- 5 conjuntos de letras diferentes descobertas (Venceu o jogo)
        ELSIF ((current_state = Win)) THEN STATE_OUT <= "101";

        -- Perdeu o jogo
        ELSIF ((current_state = Lose)) THEN STATE_OUT <= "110";

        -- Aguardando o inicio da partida
        ELSIF ((current_state = Waiting)) THEN STATE_OUT <= "111";

        END IF;

    END PROCESS output_update;

end hardware;
------------------------------------