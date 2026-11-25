-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:38:06 2026


library ieee;
use ieee.std_logic_1164.all;

entity cache_cell is
    port (
        write_data : in std_logic;
        chip_enable : in std_logic;
        rd_wrn : in std_logic;
        read_data : out std_logic
    );
end cache_cell;
