-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:38:05 2026


library ieee;
use ieee.std_logic_1164.all;

entity dff is
    port (
        d : in std_logic;
        clk : in std_logic;
        q : out std_logic;
        qbar : out std_logic
    );
end dff;
