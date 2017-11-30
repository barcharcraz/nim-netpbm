import pm_config
import pbm
type
  glyph* {.bycopy.} = object
    width*: cuint
    height*: cuint
    x*: cint
    y*: cint
    xadd*: cuint
    bmap*: cstring

  font* {.bycopy.} = object
    maxwidth*: cint
    maxheight*: cint
    x*: cint
    y*: cint
    glyph*: array[256, ptr glyph]
    oldfont*: ptr ptr bit
    fcols*: cint
    frows*: cint


proc pbm_defaultfont*(which: cstring): ptr font {.cdecl, importc: "pbm_defaultfont",
    dynlib: netpbm.}
proc pbm_dissectfont*(font: ptr ptr bit; frows: cuint; fcols: cuint): ptr font {.cdecl,
    importc: "pbm_dissectfont", dynlib: netpbm.}
proc pbm_loadfont*(filename: cstring): ptr font {.cdecl, importc: "pbm_loadfont",
    dynlib: netpbm.}
proc pbm_loadpbmfont*(filename: cstring): ptr font {.cdecl,
    importc: "pbm_loadpbmfont", dynlib: netpbm.}
proc pbm_loadbdffont*(filename: cstring): ptr font {.cdecl,
    importc: "pbm_loadbdffont", dynlib: netpbm.}
proc pbm_dumpfont*(fontP: ptr font; ofP: ptr FILE) {.cdecl, importc: "pbm_dumpfont",
    dynlib: netpbm.}
var pbm_defaultFixedfont* {.importc: "pbm_defaultFixedfont", dynlib: netpbm.}: font

var pbm_defaultBdffont* {.importc: "pbm_defaultBdffont", dynlib: netpbm.}: font
