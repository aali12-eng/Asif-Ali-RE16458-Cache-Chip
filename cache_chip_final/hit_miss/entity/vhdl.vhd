-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Mon Nov 23 09:28:29 2026


library ieee;
use ieee.std_logic_1164.all;

entity hit_miss is
    port (
        tag : in std_logic_vector(1 downto 0);
        stored_tag : in std_logic_vector(1 downto 0);
        valid : in std_logic;
        hit : inout std_logic;
        miss : out std_logic
    );
end hit_miss;
