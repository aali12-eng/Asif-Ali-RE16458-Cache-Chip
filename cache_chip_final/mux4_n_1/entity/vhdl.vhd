-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:33 2026


library ieee;
use ieee.std_logic_1164.all;

entity mux4_n_1 is
    port (
        d0 : in std_logic_vector(0 downto 0);
        d1 : in std_logic_vector(0 downto 0);
        d2 : in std_logic_vector(0 downto 0);
        d3 : in std_logic_vector(0 downto 0);
        s : in std_logic_vector(1 downto 0);
        y : out std_logic_vector(0 downto 0)
    );
end mux4_n_1;
