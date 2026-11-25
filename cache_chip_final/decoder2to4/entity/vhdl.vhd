-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:10 2026


library ieee;
use ieee.std_logic_1164.all;

entity decoder2to4 is
    port (
        a : in std_logic_vector(1 downto 0);
        en : in std_logic;
        y : out std_logic_vector(3 downto 0)
    );
end decoder2to4;
