# Vivado (xsim): chip_test waveforms with exactly the signals of the course's "Project Waveforms"
# figures, in the same order. In the Vivado Tcl Console, once the behavioral simulation is open:
#     source <path to this file>/vivado_waves.tcl
# Adds the signals, restarts the simulation and runs to 370 ns.

add_wave -radix unsigned /chip_test/clk_count
add_wave /chip_test/clock
add_wave /chip_test/reset

add_wave_divider "CPU Interface"
add_wave -radix hex /chip_test/cpu_add
add_wave -radix hex /chip_test/cpu_data
add_wave /chip_test/cpu_rd_wrn
add_wave /chip_test/start
add_wave /chip_test/busy

add_wave_divider "Memory Interface"
add_wave -radix hex /chip_test/mem_add
add_wave -radix hex /chip_test/mem_data
add_wave /chip_test/mem_en

restart
run 370 ns
