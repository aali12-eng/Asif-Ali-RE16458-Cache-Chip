-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:03 2026


library ieee;
use ieee.std_logic_1164.all;

entity or3_gate is
    port (
        a : in std_logic;
        b : in std_logic;
        c : in std_logic;
        y : out std_logic
    );
end or3_gate;
