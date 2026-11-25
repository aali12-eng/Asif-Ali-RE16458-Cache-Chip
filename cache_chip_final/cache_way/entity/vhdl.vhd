-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:38:07 2026


library ieee;
use ieee.std_logic_1164.all;

entity cache_way is
    port (
        block_select : in std_logic_vector(3 downto 0);
        byte_select : in std_logic_vector(3 downto 0);
        write : in std_logic;
        fill : in std_logic;
        reset : in std_logic;
        write_data : in std_logic_vector(7 downto 0);
        tag_in : in std_logic_vector(1 downto 0);
        read_data : out std_logic_vector(7 downto 0);
        tag_out : out std_logic_vector(1 downto 0);
        valid_out : out std_logic
    );
end cache_way;
