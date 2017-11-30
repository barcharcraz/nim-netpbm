import pm_config
import pm
import ppm

type
  ppm_fs_info* {.bycopy.} = object
    thisrederr*: ptr clong
    thisgreenerr*: ptr clong
    thisblueerr*: ptr clong
    nextrederr*: ptr clong
    nextgreenerr*: ptr clong
    nextblueerr*: ptr clong
    lefttoright*: cint
    cols*: cint
    maxval*: pixval
    flags*: cint
    pixrow*: ptr pixel
    col_end*: cint
    red*: pixval
    green*: pixval
    blue*: pixval


proc ppm_fs_init*(cols: cuint; maxval: pixval; flags: cuint): ptr ppm_fs_info {.cdecl,
    importc: "ppm_fs_init", dynlib: netpbm.}
proc ppm_fs_free*(fi: ptr ppm_fs_info) {.cdecl, importc: "ppm_fs_free", dynlib: netpbm.}
proc ppm_fs_startrow*(fi: ptr ppm_fs_info; pixrow: ptr pixel): cint {.cdecl,
    importc: "ppm_fs_startrow", dynlib: netpbm.}
proc ppm_fs_next*(fi: ptr ppm_fs_info; col: cint): cint {.cdecl, importc: "ppm_fs_next",
    dynlib: netpbm.}
proc ppm_fs_endrow*(fi: ptr ppm_fs_info) {.cdecl, importc: "ppm_fs_endrow",
                                       dynlib: netpbm.}
proc ppm_fs_update*(fi: ptr ppm_fs_info; col: cint; pP: ptr pixel) {.cdecl,
    importc: "ppm_fs_update", dynlib: netpbm.}
proc ppm_fs_update3*(fi: ptr ppm_fs_info; col: cint; r: pixval; g: pixval; b: pixval) {.
    cdecl, importc: "ppm_fs_update3", dynlib: netpbm.}