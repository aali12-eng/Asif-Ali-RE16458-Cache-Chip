# Cache Chip: Project Submission II

**Asif Ali**, Register No. **RE16458**

Two-way set-associative cache with LRU replacement. Layout, DRC and LVS in Cadence: gpdk045 (45 nm),
Virtuoso IC23.1, Pegasus 23.26 and Spectre.

## Contents

| File / folder | What it is |
|---|---|
| [`Cache_Chip_2Way_AsifAli_RE16458.pdf`](Cache_Chip_2Way_AsifAli_RE16458.pdf) | The report. It covers the layouts, the DRC and LVS of every cell, the testbench schematics and the chip waveforms. Section 2 explains how to run the project. |
| [`cache_chip_final/`](cache_chip_final) | The Cadence library: the schematic, symbol, layout and testbench (`tb_<cell>` with its maestro view) of every cell. It also holds `lvs_extra.rul`. |
| [`pwl/`](pwl) | The PWL input files of the testbenches (`tb_<cell>/<signal>.pwl`). |
| [`vhdl/two_way/`](vhdl/two_way) | The VHDL code of the chip and its testbenches (Submission I). |
| [`cds.lib`](cds.lib) | The library definitions, with the PWL and PVS paths. |
| [`lvs_extra.rul`](lvs_extra.rul) | The extra LVS rule for `state_machine` and `way_select` (Section 4 of the report). |
| [`README.txt`](README.txt) | Detailed run instructions. |
| [`screenshots/`](screenshots) | Every screenshot in the report, organised by cell: schematic, layout, testbench, DRC, LVS and waveforms. The schematics (`schematic.png`) and layouts (`layout.png`) are full-resolution exports from Virtuoso. |

## Quick start

1. Copy `cache_chip_final/` and `pwl/` next to your Cadence setup. Use its `cds.lib`, or add
   `DEFINE cache_chip_final <path>/cache_chip_final` to your own.
2. Add the PWL folder to the path before you start Virtuoso:
   `setenv CACHE_CHIP_FINAL_PWL <path>/pwl`
3. To simulate, open `cache_chip_final` > `tb_<cell>` > `maestro` and run the simulation. Use `tb_chip_hold` for the full chip.
4. To check DRC and LVS, run Pegasus with technology `gpdk045_pvs` and rule set `default`. For LVS, also add
   `cache_chip_final/lvs_extra.rul` under Tech&Rules > Rules File(s). The reason for this rule is in Section 4 of the report.
