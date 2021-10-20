-- UNIVERSIDADE FEDERAL DO RIO DE JANEIRO - UFRJ
-- Autor: Christian Marques de Oliveira Silva
-- Disciplina: Laboratório de Sistemas Digitais
-- 
-- Objetivo: Detectar se a letra inserida eh valida e fazer a mascara do que deve ser exibido
--
--	Entradas: 	KEYBOARD, START, CLK
--  Saidas:     MASK, LIFE
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
entity letter_verification is
	port(
		KEYBOARD		    :	in	std_logic_vector(15 downto 0);  -- Teclado com todas as "letras" de 4 bits possiveis (de 0 a 15)
		START               : 	in	std_logic;                      -- Sinal de atualizacao dos estados
		CLK                 : 	in	std_logic;                      -- Sinal de atualizacao dos estados
		MASK		        :	out	std_logic_vector(5 downto 0);   -- Mascara que determina quais letras foram acertadas e serao exibidas
		LIFE                : 	out	std_logic_vector(1 downto 0)    -- Vida restante: 3 (completa) a 0 (perdeu o jogo)
    );	
end letter_verification;
------------------------------------

------------------------------------
-- Arquitetura Principal
------------------------------------
architecture hardware of letter_verification is
    SIGNAL MASK_CTRL    : std_logic_vector(5 downto 0)  := (others => '0'); -- Controle da mascara de ativacao (letra correta)
    SIGNAL ERROR_CTRL   : std_logic_vector(10 downto 0) := (others => '0'); -- Controle do subtrator de vidas (letra errada)

    -- Sinal de Controle da vida restante
    SIGNAL LIFE_CTRL    : std_logic_vector(1 downto 0) := "11"; -- Controle das vidas restantes 
begin

    MASK <= MASK_CTRL;

    life_process: PROCESS(CLK)
        VARIABLE life_counter : std_logic_vector(1 downto 0) := "11"; -- Vidas restantes 
    BEGIN
    
        IF (rising_edge(CLK)) THEN 
            life_counter := "11";
            FOR index IN 0 to 10 LOOP
                IF ((ERROR_CTRL(index) = '1') and (life_counter > 0)) THEN 
                    life_counter := life_counter - 1; 
                END IF;
            END LOOP;
        END IF;

        LIFE_CTRL <= life_counter;
        LIFE <= LIFE_CTRL;
    END PROCESS life_process;

    ------------------------------------
    -- Letras corretas
    ------------------------------------
    -- Letra F
    button15_process: PROCESS(KEYBOARD(10), START)
    BEGIN
        IF (START = '1') THEN 
            MASK_CTRL(5) <= '0';

        ELSIF (rising_edge(KEYBOARD(15))) THEN 
            MASK_CTRL(5) <= '1';
        END IF;

    END PROCESS button15_process;

    -- Letra O
    button0_process: PROCESS(KEYBOARD(0), START)
    BEGIN
        IF (START = '1') THEN
            MASK_CTRL(4) <= '0';

        ELSIF (rising_edge(KEYBOARD(0))) THEN 
            MASK_CTRL(4) <= '1';
        END IF;
            
    END PROCESS button0_process;

    -- Letra C
    button12_process: PROCESS(KEYBOARD(12), START)
    BEGIN
        IF (START = '1') THEN 
            MASK_CTRL(3) <= '0';

        ELSIF (rising_edge(KEYBOARD(12))) THEN 
            MASK_CTRL(3) <= '1';
        END IF;

    END PROCESS button12_process;

    -- Letra A
    button10_process: PROCESS(KEYBOARD(10), START)
    BEGIN
        IF (START = '1') THEN 
            MASK_CTRL(0) <= '0';
            MASK_CTRL(2) <= '0';

        ELSIF (rising_edge(KEYBOARD(10))) THEN 
            MASK_CTRL(0) <= '1';
            MASK_CTRL(2) <= '1';
        END IF;

    END PROCESS button10_process;

    -- Letra D
    button13_process: PROCESS(KEYBOARD(13), START)
    BEGIN
        IF (START = '1') THEN 
            MASK_CTRL(1) <= '0';

        ELSIF (rising_edge(KEYBOARD(13))) THEN 
            MASK_CTRL(1) <= '1';
        END IF;

    END PROCESS button13_process;
    ------------------------------------

    ------------------------------------
    -- Letras invalidas
    ------------------------------------
    button1_process: PROCESS(KEYBOARD(1), START)
    BEGIN
        
        IF (START = '1') THEN
            ERROR_CTRL(0) <= '0';

        ELSIF (rising_edge(KEYBOARD(1))) THEN 
            ERROR_CTRL(0) <= '1';
        END IF;
            
    END PROCESS button1_process;

    button2_process: PROCESS(KEYBOARD(2), START)
    BEGIN
        
        IF (START = '1') THEN
            ERROR_CTRL(1) <= '0';

        ELSIF (rising_edge(KEYBOARD(2))) THEN 
            ERROR_CTRL(1) <= '1';
        END IF;
            
    END PROCESS button2_process;

    button3_process: PROCESS(KEYBOARD(3), START)
    BEGIN
        
        IF (START = '1') THEN
            ERROR_CTRL(2) <= '0';

        ELSIF (rising_edge(KEYBOARD(3))) THEN 
            ERROR_CTRL(2) <= '1';
        END IF;
            
    END PROCESS button3_process;

    button4_process: PROCESS(KEYBOARD(4), START)
    BEGIN
        
        IF (START = '1') THEN
            ERROR_CTRL(3) <= '0';

        ELSIF (rising_edge(KEYBOARD(4))) THEN 
            ERROR_CTRL(3) <= '1';
        END IF;
            
    END PROCESS button4_process;

    button5_process: PROCESS(KEYBOARD(5), START)
    BEGIN
        
        IF (START = '1') THEN
            ERROR_CTRL(4) <= '0';

        ELSIF (rising_edge(KEYBOARD(5))) THEN 
            ERROR_CTRL(4) <= '1';
        END IF;
            
    END PROCESS button5_process;

    button6_process: PROCESS(KEYBOARD(6), START)
    BEGIN
        
        IF (START = '1') THEN
            ERROR_CTRL(5) <= '0';

        ELSIF (rising_edge(KEYBOARD(6))) THEN 
            ERROR_CTRL(5) <= '1';
        END IF;
            
    END PROCESS button6_process;

    button7_process: PROCESS(KEYBOARD(7), START)
    BEGIN
        
        IF (START = '1') THEN
            ERROR_CTRL(6) <= '0';

        ELSIF (rising_edge(KEYBOARD(7))) THEN 
            ERROR_CTRL(6) <= '1';
        END IF;
            
    END PROCESS button7_process;

    button8_process: PROCESS(KEYBOARD(8), START)
    BEGIN
        
        IF (START = '1') THEN
            ERROR_CTRL(7) <= '0';

        ELSIF (rising_edge(KEYBOARD(8))) THEN 
            ERROR_CTRL(7) <= '1';
        END IF;
            
    END PROCESS button8_process;

    button9_process: PROCESS(KEYBOARD(9), START)
    BEGIN
        
        IF (START = '1') THEN
            ERROR_CTRL(8) <= '0';

        ELSIF (rising_edge(KEYBOARD(9))) THEN 
            ERROR_CTRL(8) <= '1';
        END IF;
            
    END PROCESS button9_process;

    button11_process: PROCESS(KEYBOARD(11), START)
    BEGIN
        
        IF (START = '1') THEN
            ERROR_CTRL(9) <= '0';

        ELSIF (rising_edge(KEYBOARD(11))) THEN 
            ERROR_CTRL(9) <= '1';
        END IF;
            
    END PROCESS button11_process;

    button14_process: PROCESS(KEYBOARD(14), START)
    BEGIN
        
        IF (START = '1') THEN
            ERROR_CTRL(10) <= '0';

        ELSIF (rising_edge(KEYBOARD(14))) THEN 
            ERROR_CTRL(10) <= '1';
        END IF;
            
    END PROCESS button14_process;
    ------------------------------------

end hardware;
------------------------------------