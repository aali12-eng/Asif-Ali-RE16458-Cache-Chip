-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:34 2026


library ieee;
use ieee.std_logic_1164.all;

entity lru is
    port (
        clk : in std_logic;
        reset : in std_logic;
        block_offset : in std_logic_vector(1 downto 0);
        update : in std_logic;
        used_way : in std_logic;
        lru_way : out std_logic
    );
end lru;
