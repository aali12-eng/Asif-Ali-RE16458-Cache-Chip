-- Created by @(#)$CDS: vhdlin version IC23.1-64b 06/21/2023 09:20 (cpgbld16) $
-- on Sun Nov 22 21:36:09 2026


library ieee;
use ieee.std_logic_1164.all;

package cache_pkg is
    -- propagation delay of every basic gate: 100 ps, a conservative figure for the 45 nm
    -- (gpdk045) process. The longest path in one clock cycle (CPU address register -> block
    -- decoder -> cache cells -> tag compare -> hit / victim -> next state) is about 15 gates,
    -- so it settles in ~1.5 ns, well inside the 10 ns clock period of the course testbench.
    constant GATE_DELAY : time := 100 ps;

    constant ADDR_W     : natural := 6;       -- CPU / memory address width
    constant DATA_W     : natural := 8;       -- one byte per location
    constant TAG_W      : natural := 2;
    constant NUM_WAYS   : natural := 2;
    constant NUM_BLOCKS : natural := 4;       -- blocks per way
    constant NUM_BYTES  : natural := 4;       -- bytes per block
    constant COUNT_W    : natural := 5;       -- read-miss cycle counter
end package cache_pkg;
