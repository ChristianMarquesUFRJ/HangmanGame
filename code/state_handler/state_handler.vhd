-- UNIVERSIDADE FEDERAL DO RIO DE JANEIRO - UFRJ
-- Autor: Christian Marques de Oliveira Silva
--	Disciplina: Laboratório de Sistemas Digitais
--
-- Objetivo: Manipular os estados do sistema baseado no estado atual e nas entradas
--
--	Entradas: 	IS_CORRECT_LETTER, START, CLK
--  Saidas:     LIFE, STATE_OUT
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
		IS_CORRECT_LETTER   : 	in	std_logic_vector(1 downto 0);   -- Status da nova letra: 0 (nenhuma letra nova), 1 (letra errada) e 2 (letra correta)
		START               : 	in	std_logic;                      -- Comando para comecar o jogo
		CLK                 : 	in	std_logic;                      -- Sinal de atualizacao dos estados
		LIFE                : 	out	std_logic_vector(1 downto 0);       -- Vida restante: 3(completa) a 0 (perdeu o jogo)
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

    -- Constantes de comparacao para o estado da letra atual
    CONSTANT NO_LETTER : std_logic_vector(1 downto 0) := "00"; -- Nenhuma letra nova
    CONSTANT WRONG_LETTER : std_logic_vector(1 downto 0) := "01"; -- Letra errada
    CONSTANT CORRECT_LETTER : std_logic_vector(1 downto 0) := "10"; -- Letra certa

    -- Sinal de Controle da vida restante
    SIGNAL LIFE_CTRL : std_logic_vector(1 downto 0) := "11"; -- Vidas restantes 
begin

    -- Atualizacao da vida restante
    update_life: PROCESS (IS_CORRECT_LETTER, CLK)
        VARIABLE life_counter : std_logic_vector(1 downto 0) := "11"; -- Vidas restantes 
    BEGIN
        IF (current_state = Waiting) THEN 
            life_counter := "11";
        -- Quando a letra eh errada eh o unico momento em que ocorre transicao de 0 para 1 no LSB ("00" -> "01" ou "10" -> "01")     
        ELSIF (IS_CORRECT_LETTER(0)'event and IS_CORRECT_LETTER(0) = '1') THEN
            life_counter := life_counter - 1;
        END IF;

        LIFE_CTRL <= life_counter;
        LIFE <= LIFE_CTRL;
    END PROCESS update_life;

    -- Transicao de estados
    change_state: PROCESS (START, IS_CORRECT_LETTER, CLK)
    BEGIN
        -- Se finalizou o jogo ou esta aguardando o start, o estado atual deve ser o de espera 
        IF (((current_state = Waiting) or (current_state = Win) or (current_state = Lose)) and (START = '0') and rising_edge(CLK)) THEN
            current_state   <= Waiting;
            next_state      <= Char0;

        -- Caso esteja em espera e receba o comando de start, o estado atual passa a ser o de CHAR_0 e o proximo CHAR_1
        ELSIF (((current_state = Waiting) or (current_state = Win) or (current_state = Lose)) and (START = '1') and rising_edge(CLK)) THEN
            current_state   <= Char0;
            next_state      <= Char1;

        -- Caso esteja em CHAR_0 e receba uma letra valida, o estado atual passa a ser o de CHAR_1 e o proximo CHAR_2
        ELSIF ((current_state = Char0) and (IS_CORRECT_LETTER = CORRECT_LETTER) and rising_edge(CLK)) THEN
            current_state   <= next_state;
            next_state      <= Char2;
        
        -- Caso esteja em CHAR_1 e receba uma letra valida, o estado atual passa a ser o de CHAR_2 e o proximo CHAR_3
        ELSIF ((current_state = Char1) and (IS_CORRECT_LETTER = CORRECT_LETTER) and rising_edge(CLK)) THEN
            current_state   <= next_state;
            next_state      <= Char3;
        
        -- Caso esteja em CHAR_2 e receba uma letra valida, o estado atual passa a ser o de CHAR_3 e o proximo CHAR_4
        ELSIF ((current_state = Char2) and (IS_CORRECT_LETTER = CORRECT_LETTER) and rising_edge(CLK)) THEN
            current_state   <= next_state;
            next_state      <= Char4;
        
        -- Caso esteja em CHAR_3 e receba uma letra valida, o estado atual passa a ser o de CHAR_4 e o proximo WIN
        ELSIF ((current_state = Char3) and (IS_CORRECT_LETTER = CORRECT_LETTER) and rising_edge(CLK)) THEN
            current_state   <= next_state;
            next_state      <= Win;
        
        -- Caso esteja em CHAR_4 e receba uma letra valida, o estado atual passa a ser o de WIN
        ELSIF ((current_state = Char4) and (IS_CORRECT_LETTER = CORRECT_LETTER) and rising_edge(CLK)) THEN
            current_state   <= next_state;
        
        -- Caso nao esteja no modo espera e nao houver mais vida restante, o estado atual passa a ser o de LOSE
        ELSIF ((current_state /= Waiting) and (LIFE_CTRL = 0) and rising_edge(CLK)) THEN
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