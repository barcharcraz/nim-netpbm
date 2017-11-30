import pm_config
import pm

type
  bit* = cuchar

proc pbm_init*(argcP: ptr cint; argv: cstringArray) {.cdecl, importc: "pbm_init",
    dynlib: netpbm.}
proc pbm_nextimage*(file: ptr FILE; eofP: ptr cint) {.cdecl, importc: "pbm_nextimage",
    dynlib: netpbm.}
proc pbm_allocrow*(cols: cuint): ptr bit {.cdecl, importc: "pbm_allocrow",
                                      dynlib: netpbm.}
proc pbm_readpbm*(file: ptr FILE; colsP: ptr cint; rowsP: ptr cint): ptr ptr bit {.cdecl,
    importc: "pbm_readpbm", dynlib: netpbm.}
proc pbm_readpbminit*(file: ptr FILE; colsP: ptr cint; rowsP: ptr cint; formatP: ptr cint) {.
    cdecl, importc: "pbm_readpbminit", dynlib: netpbm.}
proc pbm_readpbmrow*(file: ptr FILE; bitrow: ptr bit; cols: cint; format: cint) {.cdecl,
    importc: "pbm_readpbmrow", dynlib: netpbm.}
proc pbm_readpbmrow_packed*(file: ptr FILE; packedBits: ptr cuchar; cols: cint;
                           format: cint) {.cdecl, importc: "pbm_readpbmrow_packed",
    dynlib: netpbm.}
proc pbm_readpbmrow_bitoffset*(fileP: ptr FILE; packedBits: ptr cuchar; cols: cint;
                              format: cint; offset: cuint) {.cdecl,
    importc: "pbm_readpbmrow_bitoffset", dynlib: netpbm.}
proc pbm_cleanrowend_packed*(packedBits: ptr cuchar; cols: cuint) {.cdecl,
    importc: "pbm_cleanrowend_packed", dynlib: netpbm.}
proc pbm_writepbminit*(fileP: ptr FILE; cols: cint; rows: cint; forceplain: cint) {.cdecl,
    importc: "pbm_writepbminit", dynlib: netpbm.}
proc pbm_writepbm*(fileP: ptr FILE; bits: ptr ptr bit; cols: cint; rows: cint;
                  forceplain: cint) {.cdecl, importc: "pbm_writepbm", dynlib: netpbm.}
proc pbm_writepbmrow*(fileP: ptr FILE; bitrow: ptr bit; cols: cint; forceplain: cint) {.
    cdecl, importc: "pbm_writepbmrow", dynlib: netpbm.}
proc pbm_writepbmrow_packed*(fileP: ptr FILE; packed_bits: ptr cuchar; cols: cint;
                            forceplain: cint) {.cdecl,
    importc: "pbm_writepbmrow_packed", dynlib: netpbm.}
proc pbm_writepbmrow_bitoffset*(ifP: ptr FILE; packedBits: ptr cuchar; cols: cuint;
                               format: cint; offset: cuint) {.cdecl,
    importc: "pbm_writepbmrow_bitoffset", dynlib: netpbm.}
proc pbm_check*(file: ptr FILE; check_type: pm_check_type; format: cint; cols: cint;
               rows: cint; retval_p: ptr pm_check_code) {.cdecl, importc: "pbm_check",
    dynlib: netpbm.}
proc pbm_backgroundbitrow*(packedBits: ptr cuchar; cols: cuint; offset: cuint): bit {.
    cdecl, importc: "pbm_backgroundbitrow", dynlib: netpbm.}