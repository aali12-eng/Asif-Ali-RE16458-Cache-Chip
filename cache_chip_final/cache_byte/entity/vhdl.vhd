-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:23 2026


library ieee;
use ieee.std_logic_1164.all;

entity cache_byte is
    port (
        write_data : in std_logic_vector(7 downto 0);
        chip_enable : in std_logic;
        rd_wrn : in std_logic;
        read_data : out std_logic_vector(7 downto 0)
    );
end cache_byte;
