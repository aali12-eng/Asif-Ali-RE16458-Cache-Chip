; cache_chip_final library initialisation (Virtuoso loads this file automatically when the library
; is opened, wherever it is installed).
;
; The testbenches' piecewise-linear sources (vpwlf) read their waveforms from <library>/pwl:
;   fileName = "$CACHE_CHIP_FINAL_PWL/tb_<cell>/<signal>.pwl"
; Spectre expands the environment variable, so it is set here to this library's own location:
; the library can be moved, copied or unpacked anywhere and the simulations still find their inputs.
let((lib)
  lib = ddGetObj("cache_chip_final")
  when(lib
    setShellEnvVar(strcat("CACHE_CHIP_FINAL_PWL=" lib~>readPath "/pwl"))))
