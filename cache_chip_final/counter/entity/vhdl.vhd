-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:19 2026


library ieee;
use ieee.std_logic_1164.all;

entity counter is
    port (
        count : in std_logic;
        restart : in std_logic;
        clk : in std_logic;
        q : inout std_logic_vector(4 downto 0)
    );
end counter;
