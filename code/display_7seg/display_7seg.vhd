--	Objetivo: Exibir valor em um display de 7 segmentos
--
-- Entradas: 	VALUE_IN, 
-- Saidas: 		DISPLAY_OUT
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
entity display_7seg is 
	port(
		VALUE_IN	:	in	std_logic_vector(4 downto 0);	-- Codido de entrada para visualizacao (4=Oculto, 3-0=valores)
		CLK     	: 	in	std_logic;                      -- Sinal de atualizacao dos estados
		DISPLAY_OUT	:	out	std_logic_vector(6 downto 0));	-- Segmentos a serem acesos
end display_7seg;
------------------------------------

------------------------------------
-- Arquitetura Principal
------------------------------------
architecture hardware of display_7seg is

begin
	process(CLK)
	begin
		
		if (rising_edge(CLK)) then
			case VALUE_IN is
				--							    6543210
				when "00000" => DISPLAY_OUT <= "1000000"; -- "0"     
				when "00001" => DISPLAY_OUT <= "1111001"; -- "1" 
				when "00010" => DISPLAY_OUT <= "0100100"; -- "2" 
				when "00011" => DISPLAY_OUT <= "0110000"; -- "3" 
				when "00100" => DISPLAY_OUT <= "0011001"; -- "4" 
				when "00101" => DISPLAY_OUT <= "0010010"; -- "5" 
				when "00110" => DISPLAY_OUT <= "0000011"; -- "6" 
				when "00111" => DISPLAY_OUT <= "1111000"; -- "7" 
				when "01000" => DISPLAY_OUT <= "0000000"; -- "8"
				when "01001" => DISPLAY_OUT <= "0011000"; -- "9"
				when "01010" => DISPLAY_OUT <= "0001000"; -- "A"
				when "01011" => DISPLAY_OUT <= "0000011"; -- "B"
				when "01100" => DISPLAY_OUT <= "1000110"; -- "C"
				when "01101" => DISPLAY_OUT <= "0100001"; -- "D"
				when "01110" => DISPLAY_OUT <= "0000110"; -- "E"
				when "01111" => DISPLAY_OUT <= "0001110"; -- "F"
				when "10000" => DISPLAY_OUT <= "1110111"; -- "-"
				when "10001" => DISPLAY_OUT <= "0000010"; -- "G" 
				when "10010" => DISPLAY_OUT <= "0001100"; -- "P" 
				when others => DISPLAY_OUT <= "1111111"; -- "apagado"
			end case;
		end if;
	end process;
	
end hardware;
------------------------------------