-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:11 2026


library ieee;
use ieee.std_logic_1164.all;

entity and_reduce_n is
    port (
        a : in std_logic_vector(3 downto 0);
        y : out std_logic
    );
end and_reduce_n;
