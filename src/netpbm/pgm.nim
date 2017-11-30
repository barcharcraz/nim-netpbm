import pm_config
import pm
type
  gray* = cuint

proc pgm_init*(argcP: ptr cint; argv: cstringArray) {.cdecl, importc: "pgm_init",
    dynlib: netpbm.}
proc pgm_allocrow*(cols: cuint): ptr gray {.cdecl, importc: "pgm_allocrow",
                                       dynlib: netpbm.}
proc pgm_readpgm*(file: ptr FILE; colsP: ptr cint; rowsP: ptr cint; maxvalP: ptr gray): ptr ptr gray {.
    cdecl, importc: "pgm_readpgm", dynlib: netpbm.}
proc pgm_readpgminit*(file: ptr FILE; colsP: ptr cint; rowsP: ptr cint; maxvalP: ptr gray;
                     formatP: ptr cint) {.cdecl, importc: "pgm_readpgminit",
                                       dynlib: netpbm.}
proc pgm_readpgmrow*(file: ptr FILE; grayrow: ptr gray; cols: cint; maxval: gray;
                    format: cint) {.cdecl, importc: "pgm_readpgmrow", dynlib: netpbm.}
proc pgm_writepgminit*(fileP: ptr FILE; cols: cint; rows: cint; maxval: gray;
                      forceplain: cint) {.cdecl, importc: "pgm_writepgminit",
                                        dynlib: netpbm.}
proc pgm_writepgmrow*(fileP: ptr FILE; grayrow: ptr gray; cols: cint; maxval: gray;
                     forceplain: cint) {.cdecl, importc: "pgm_writepgmrow",
                                       dynlib: netpbm.}
proc pgm_writepgm*(fileP: ptr FILE; grays: ptr ptr gray; cols: cint; rows: cint;
                  maxval: gray; forceplain: cint) {.cdecl, importc: "pgm_writepgm",
    dynlib: netpbm.}
proc pgm_nextimage*(file: ptr FILE; eofP: ptr cint) {.cdecl, importc: "pgm_nextimage",
    dynlib: netpbm.}
proc pgm_check*(file: ptr FILE; check_type: pm_check_type; format: cint; cols: cint;
               rows: cint; maxval: gray; retval_p: ptr pm_check_code) {.cdecl,
    importc: "pgm_check", dynlib: netpbm.}