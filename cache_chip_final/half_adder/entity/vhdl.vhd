-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:09 2026


library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
    port (
        a : in std_logic;
        b : in std_logic;
        sum : out std_logic;
        carry : out std_logic
    );
end half_adder;
