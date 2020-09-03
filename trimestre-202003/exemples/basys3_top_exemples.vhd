---------------------------------------------------------------------------------------------------
-- 
-- basys3_top_exemples.vhd
--
-- Pour montrer des exemples de code en classe
--
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;  

entity basys3_top_exemples is
    port(
        btnC : in std_logic; -- bouton du centre
        btnU : in std_logic; -- bouton du haut
        btnL : in std_logic; -- bouton de gauche
        btnR : in std_logic; -- bouton de droite
        btnD : in std_logic; -- bouton du bas
        sw : in std_logic_vector(15 downto 0); -- les 16 commutateurs
        led : out std_logic_vector(15 downto 0) -- les 16 LED
    );
end basys3_top_exemples;

architecture arch of basys3_top_exemples is

begin
        
    led(0) <= sw(1) xor sw(0);
    
end arch;