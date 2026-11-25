-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:27:59 2026


library ieee;
use ieee.std_logic_1164.all;

entity and2_gate is
    port (
        a : in std_logic;
        b : in std_logic;
        y : out std_logic
    );
end and2_gate;
