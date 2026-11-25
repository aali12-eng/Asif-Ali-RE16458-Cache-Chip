-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Sun Nov 22 21:36:09 2026


library ieee;
use ieee.std_logic_1164.all;
use work.cache_pkg.all;

entity not_gate is
    port (
        a : in  std_logic;
        y : out std_logic
    );
end entity not_gate;
