-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:07 2026


library ieee;
use ieee.std_logic_1164.all;

entity selector is
    port (
        chip_enable : in std_logic;
        rd_wrn : in std_logic;
        read_enable : out std_logic;
        write_enable : out std_logic
    );
end selector;
