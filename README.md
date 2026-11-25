# CMPE 413/640 Cache Chip: Project Submission II

Two-way set-associative cache with LRU replacement. Layout, DRC and LVS in Cadence: gpdk045 (45 nm),
Virtuoso IC23.1, Pegasus 23.26 and Spectre.

**Asif Ali** (RE16458)

## Contents

| File / folder | What it is |
|---|---|
| [`Cache_Chip_2Way_Layout_Report.pdf`](Cache_Chip_2Way_Layout_Report.pdf) | The report. It covers the layouts, the DRC and LVS of every cell, the testbench schematics and the chip waveforms. Section 2 explains how to run the project. |
| [`Cache_Chip_Submission_II.zip`](Cache_Chip_Submission_II.zip) | The project. It holds the Cadence library `cache_chip_final` (schematic, symbol, layout and testbench of every cell, plus the `pwl/` input files), the VHDL code (`vhdl/two_way`), `cds.lib`, the extra LVS rule `lvs_extra.rul` and a `README.txt`. |
| [`screenshots/`](screenshots) | Every screenshot in the report, organised by cell: schematic, layout, testbench, DRC, LVS and waveforms. |

## Quick start

1. Unpack the zip next to your Cadence setup. Use its `cds.lib`, or add
   `DEFINE cache_chip_final <path>/cache_chip_final` to your own.
2. Add the PWL folder to the path before you start Virtuoso:
   `setenv CACHE_CHIP_FINAL_PWL <path>/cache_chip_final/pwl`
3. To simulate, open `cache_chip_final` > `tb_<cell>` > `maestro` and run the simulation. Use `tb_chip_hold` for the full chip.
4. To check DRC and LVS, run Pegasus with technology `gpdk045_pvs` and rule set `default`. For LVS, also add
   `cache_chip_final/lvs_extra.rul` under Tech&Rules > Rules File(s). The reason for this rule is in Section 4 of the report.
