-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:30 2026


library ieee;
use ieee.std_logic_1164.all;

entity way_select is
    port (
        hit0 : in std_logic;
        hit1 : in std_logic;
        valid0 : in std_logic;
        valid1 : in std_logic;
        lru_way : in std_logic;
        hit : inout std_logic;
        miss : out std_logic;
        hit_way : out std_logic;
        victim : out std_logic
    );
end way_select;
