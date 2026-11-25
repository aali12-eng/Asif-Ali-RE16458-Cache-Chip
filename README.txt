Cache Chip - Project Submission II
Two-way set associative cache with LRU, gpdk045 (45 nm), Virtuoso IC23.1, Pegasus 23.26, Spectre
Asif Ali, Reg. No. RE16458, aali12@umbc.edu
================================================================================================

Contents
  cache_chip_final/   the Cadence library: schematic, symbol and layout of every cell, the tb_<cell>
                      testbench schematics with their maestro views,
                      lvs_extra.rul   the extra LVS rule (see below)
  pwl/                the PWL input files of the testbenches (tb_<cell>/<signal>.pwl)
  vhdl/two_way/       the VHDL code of the chip and its testbenches (testbench/chip_test.vhd is the
                      course testbench, read with testbench/chip_in.txt)
  cds.lib             library definitions, with the PWL and PVS paths
  lvs_extra.rul       copy of cache_chip_final/lvs_extra.rul
  The report: Cache_Chip_2Way_AsifAli_RE16458.pdf (Section 2: how to run the project)

1. Install
   Copy cache_chip_final/ and pwl/ next to your Cadence setup and add to cds.lib:   DEFINE cache_chip_final <path>/cache_chip_final
   (or use the cds.lib given here). gpdk045 must be defined.

2. PWL folder path (simulation inputs)
   The vpwlf sources read $CACHE_CHIP_FINAL_PWL/tb_<cell>/<signal>.pwl, so add the pwl folder to the
   path before starting Virtuoso:
       setenv CACHE_CHIP_FINAL_PWL <path>/pwl          (csh/tcsh)
       export CACHE_CHIP_FINAL_PWL=<path>/pwl          (bash)

3. Simulation
   cache_chip_final > tb_<cell> > maestro > Run Simulation (Spectre, gpdk045 models, section tt).
   The chip is demonstrated with tb_chip_hold (read miss 19, write hit/miss 3, read hit 2 clocks).

4. DRC and LVS (Pegasus)
   Technology library /umbc/software/design_kits2/gpdk045_v_6_0/pvtech.lib, gpdk045_pvs, rule set default.
   Expected: DRC 0 results (562 rule checks), LVS MATCH for every cell.

5. LVS rule exception (state_machine, way_select)
   In the VHDL one output is assigned to another (state(1) <= latch_way; hit_way <= hit1;), so the
   schematic joins the two names with a zero-ohm cds_thru, which the CDL netlist writes as R ... $[SH]
   with *.RESI = 2000. Pegasus does not support *.RESI, so it would report that link as a mismatch.
   lvs_extra.rul holds:   lvs_filter_device R(SH) -short -source;
   It removes those zero-ohm links from the schematic side and shorts their nets.
   Add it: Pegasus > Run LVS > Tech&Rules tab > Rules File(s): <path>/cache_chip_final/lvs_extra.rul > Add
   > Submit. (Command line: give it after .technology.rul, or append its line to pegasuslvsctl.)

6. VHDL simulation (Submission I)
   Compile the files of vhdl/two_way in dependency order (cache_pkg, primitives, gates, blocks, cache,
   control, chip) with -v93, then testbench/chip_test.vhd; run 360 ns.
