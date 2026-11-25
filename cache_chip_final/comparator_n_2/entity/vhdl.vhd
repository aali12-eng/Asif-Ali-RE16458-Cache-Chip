-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:28 2026


library ieee;
use ieee.std_logic_1164.all;

entity comparator_n_2 is
    port (
        a : in std_logic_vector(1 downto 0);
        b : in std_logic_vector(1 downto 0);
        eq : out std_logic
    );
end comparator_n_2;
