-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:32 2026


library ieee;
use ieee.std_logic_1164.all;

entity mux2_n_1 is
    port (
        a : in std_logic_vector(0 downto 0);
        b : in std_logic_vector(0 downto 0);
        s : in std_logic;
        y : out std_logic_vector(0 downto 0)
    );
end mux2_n_1;
