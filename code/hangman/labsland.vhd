-- UNIVERSIDADE FEDERAL DO RIO DE JANEIRO - UFRJ
-- Autor: Christian Marques de Oliveira Silva
-- Disciplina: Laboratório de Sistemas Digitais
--
--	Objetivo: 
--
--	Requisitos:
--
--	Funcionamento
--		
-----------------------------------------------------------------------------------------------------

------------------------------------
-- Bibliotecas
------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
------------------------------------

------------------------------------
-- Entidade Principal
------------------------------------
entity labsland is port(
	V_SW		:	in	std_logic_vector(15 downto 0);	-- Entradas das letras
	V_BT		: 	in std_logic_vector(1 downto 0);	-- Botao de Start
	G_CLOCK_50	:	in	std_logic;						-- Clock para o funcionamento do sistema
	G_HEX7	    :	out	std_logic_vector(6 downto 0);	-- Letra 6
	G_HEX6	    :	out	std_logic_vector(6 downto 0);	-- Letra 5
	G_HEX5	    :	out	std_logic_vector(6 downto 0);	-- Letra 4
	G_HEX4	    :	out	std_logic_vector(6 downto 0);	-- Letra 3
	G_HEX3	    :	out	std_logic_vector(6 downto 0);	-- Letra 2
	G_HEX2	    :	out	std_logic_vector(6 downto 0);	-- Letra 1
	G_HEX0	    :	out	std_logic_vector(6 downto 0);	-- Status do jogo
	G_LED	    :	out	std_logic_vector(2 downto 0)	-- Vidas restantes
	);
end labsland;

------------------------------------
-- Arquitetura Principal
------------------------------------
architecture hardware of labsland is

	-- Definicao do componente
	component hangman is
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
	end component;
	--
begin

	hangman_game: hangman PORT MAP(not V_BT(0), G_CLOCK_50, V_SW, G_HEX2, G_HEX3, G_HEX4, G_HEX5, G_HEX6, G_HEX7, G_HEX0, G_LED);

end hardware;
------------------------------------