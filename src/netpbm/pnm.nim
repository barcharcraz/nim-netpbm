import pm_config
import pm
import ppm
type
  xel* = pixel
  xelval* = pixval

proc pnm_init*(argcP: ptr cint; argv: cstringArray) {.cdecl, importc: "pnm_init",
    dynlib: netpbm.}
proc pnm_nextimage*(file: ptr FILE; eofP: ptr cint) {.cdecl, importc: "pnm_nextimage",
    dynlib: netpbm.}
proc pnm_allocrow*(cols: cuint): ptr xel {.cdecl, importc: "pnm_allocrow",
                                      dynlib: netpbm.}
proc pnm_readpnminit*(fileP: ptr FILE; colsP: ptr cint; rowsP: ptr cint;
                     maxvalP: ptr xelval; formatP: ptr cint) {.cdecl,
    importc: "pnm_readpnminit", dynlib: netpbm.}
proc pnm_readpnmrow*(fileP: ptr FILE; xelrow: ptr xel; cols: cint; maxval: xelval;
                    format: cint) {.cdecl, importc: "pnm_readpnmrow", dynlib: netpbm.}
proc pnm_readpnm*(fileP: ptr FILE; colsP: ptr cint; rowsP: ptr cint; maxvalP: ptr xelval;
                 formatP: ptr cint): ptr ptr xel {.cdecl, importc: "pnm_readpnm",
    dynlib: netpbm.}
proc pnm_check*(fileP: ptr FILE; check_type: pm_check_type; format: cint; cols: cint;
               rows: cint; maxval: cint; retvalP: ptr pm_check_code) {.cdecl,
    importc: "pnm_check", dynlib: netpbm.}
proc pnm_writepnminit*(fileP: ptr FILE; cols: cint; rows: cint; maxval: xelval;
                      format: cint; forceplain: cint) {.cdecl,
    importc: "pnm_writepnminit", dynlib: netpbm.}
proc pnm_writepnmrow*(fileP: ptr FILE; xelrow: ptr xel; cols: cint; maxval: xelval;
                     format: cint; forceplain: cint) {.cdecl,
    importc: "pnm_writepnmrow", dynlib: netpbm.}
proc pnm_writepnm*(fileP: ptr FILE; xels: ptr ptr xel; cols: cint; rows: cint;
                  maxval: xelval; format: cint; forceplain: cint) {.cdecl,
    importc: "pnm_writepnm", dynlib: netpbm.}
proc pnm_backgroundxel*(xels: ptr ptr xel; cols: cint; rows: cint; maxval: xelval;
                       format: cint): xel {.cdecl, importc: "pnm_backgroundxel",
    dynlib: netpbm.}
proc pnm_backgroundxelrow*(xelrow: ptr xel; cols: cint; maxval: xelval; format: cint): xel {.
    cdecl, importc: "pnm_backgroundxelrow", dynlib: netpbm.}
proc pnm_whitexel*(maxval: xelval; format: cint): xel {.cdecl, importc: "pnm_whitexel",
    dynlib: netpbm.}
proc pnm_blackxel*(maxval: xelval; format: cint): xel {.cdecl, importc: "pnm_blackxel",
    dynlib: netpbm.}
proc pnm_invertxel*(x: ptr xel; maxval: xelval; format: cint) {.cdecl,
    importc: "pnm_invertxel", dynlib: netpbm.}
proc pnm_promoteformat*(xels: ptr ptr xel; cols: cint; rows: cint; maxval: xelval;
                       format: cint; newmaxval: xelval; newformat: cint) {.cdecl,
    importc: "pnm_promoteformat", dynlib: netpbm.}
proc pnm_promoteformatrow*(xelrow: ptr xel; cols: cint; maxval: xelval; format: cint;
                          newmaxval: xelval; newformat: cint) {.cdecl,
    importc: "pnm_promoteformatrow", dynlib: netpbm.}
proc pnm_xeltopixel*(inputxel: xel; format: cint): pixel {.cdecl,
    importc: "pnm_xeltopixel", dynlib: netpbm.}
proc pnm_parsecolorxel*(colorName: cstring; maxval: xelval; format: cint): xel {.cdecl,
    importc: "pnm_parsecolorxel", dynlib: netpbm.}