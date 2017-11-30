import pm_config
import pgm
import pm
import ppmcmap
type
  pixval* = gray
  pixel* {.bycopy.} = object
    r*: pixval
    g*: pixval
    b*: pixval


proc ppm_whitepixel*(maxval: pixval): pixel {.inline, cdecl.} =
  var retval: pixel
  (retval).r = (maxval)
  (retval).g = (maxval)
  (retval).b = (maxval)
  return retval

proc ppm_blackpixel*(): pixel {.inline, cdecl.} =
  var retval: pixel
  return retval

proc ppm_init*(argcP: ptr cint; argv: cstringArray) {.cdecl, importc: "ppm_init",
    dynlib: netpbm.}
proc ppm_allocrow*(cols: cuint): ptr pixel {.cdecl, importc: "ppm_allocrow",
                                        dynlib: netpbm.}
proc ppm_readppm*(fileP: ptr FILE; colsP: ptr cint; rowsP: ptr cint; maxvalP: ptr pixval): ptr ptr pixel {.
    cdecl, importc: "ppm_readppm", dynlib: netpbm.}
proc ppm_readppminit*(fileP: ptr FILE; colsP: ptr cint; rowsP: ptr cint;
                     maxvalP: ptr pixval; formatP: ptr cint) {.cdecl,
    importc: "ppm_readppminit", dynlib: netpbm.}
proc ppm_readppmrow*(fileP: ptr FILE; pixelrow: ptr pixel; cols: cint; maxval: pixval;
                    format: cint) {.cdecl, importc: "ppm_readppmrow", dynlib: netpbm.}
proc ppm_writeppm*(fileP: ptr FILE; pixels: ptr ptr pixel; cols: cint; rows: cint;
                  maxval: pixval; forceplain: cint) {.cdecl, importc: "ppm_writeppm",
    dynlib: netpbm.}
proc ppm_writeppminit*(fileP: ptr FILE; cols: cint; rows: cint; maxval: pixval;
                      forceplain: cint) {.cdecl, importc: "ppm_writeppminit",
                                        dynlib: netpbm.}
proc ppm_writeppmrow*(fileP: ptr FILE; pixelrow: ptr pixel; cols: cint; maxval: pixval;
                     forceplain: cint) {.cdecl, importc: "ppm_writeppmrow",
                                       dynlib: netpbm.}
proc ppm_check*(fileP: ptr FILE; check_type: pm_check_type; format: cint; cols: cint;
               rows: cint; maxval: pixval; retval_p: ptr pm_check_code) {.cdecl,
    importc: "ppm_check", dynlib: netpbm.}
proc ppm_nextimage*(fileP: ptr FILE; eofP: ptr cint) {.cdecl, importc: "ppm_nextimage",
    dynlib: netpbm.}
proc ppm_parsecolor*(colorname: cstring; maxval: pixval): pixel {.cdecl,
    importc: "ppm_parsecolor", dynlib: netpbm.}
proc ppm_parsecolor2*(colorname: cstring; maxval: pixval; closeOk: cint): pixel {.cdecl,
    importc: "ppm_parsecolor2", dynlib: netpbm.}
proc ppm_colorname*(colorP: ptr pixel; maxval: pixval; hexok: cint): cstring {.cdecl,
    importc: "ppm_colorname", dynlib: netpbm.}
proc ppm_readcolordict*(fileName: cstring; mustOpen: cint; nColorsP: ptr cuint;
                       colornamesP: ptr cstringArray; colorsP: ptr ptr pixel;
                       chtP: ptr colorhash_table) {.cdecl,
    importc: "ppm_readcolordict", dynlib: netpbm.}
proc ppm_readcolornamefile*(fileName: cstring; mustOpen: cint;
                           chtP: ptr colorhash_table; colornamesP: ptr cstringArray) {.
    cdecl, importc: "ppm_readcolornamefile", dynlib: netpbm.}
proc ppm_freecolornames*(colornames: cstringArray) {.cdecl,
    importc: "ppm_freecolornames", dynlib: netpbm.}
proc PPM_DISTANCE*(p1: pixel; p2: pixel): cuint {.inline, cdecl.} =
  return (((p1).r) - ((p2).r)) * (((p1).r) - ((p2).r)) +
      (((p1).g) - ((p2).g)) * (((p1).g) - ((p2).g)) +
      (((p1).b) - ((p2).b)) * (((p1).b) - ((p2).b))

proc ppm_color_from_ycbcr*(y: cuint; cb: cint; cr: cint): pixel {.cdecl,
    importc: "ppm_color_from_ycbcr", dynlib: netpbm.}
type
  hsv* {.bycopy.} = object
    h*: cdouble
    s*: cdouble
    v*: cdouble


proc ppm_color_from_hsv*(hsv: hsv; maxval: pixval): pixel {.cdecl,
    importc: "ppm_color_from_hsv", dynlib: netpbm.}
proc ppm_hsv_from_color*(color: pixel; maxval: pixval): hsv {.cdecl,
    importc: "ppm_hsv_from_color", dynlib: netpbm.}
proc ppm_luminosity*(p: pixel): pixval {.inline, cdecl.} =
  return (pixval)(((0.2989) * ((p).r.float) + (0.5866) * ((p).g.float) + (0.1145) * ((p).b.float)) + 0.5)

proc ppm_colorvalue*(p: pixel): pixval {.inline, cdecl.} =
  return if (((p).r)) > ((if (((p).g)) > (((p).b)): (((p).g)) else: (((p).b)))): (((p).r)) else: (
      (if (((p).g)) > (((p).b)): (((p).g)) else: (((p).b))))

proc ppm_saturation*(p: pixel; maxval: pixval): pixval {.inline, cdecl.} =
  var maxIntensity: pixval
  var minIntensity: pixval
  var range: pixval
  return (pixval)(cast[culong](range * maxval div maxIntensity))

type
  bk_color* {.size: sizeof(cint).} = enum
    BKCOLOR_GRAY = 0, BKCOLOR_BROWN, BKCOLOR_ORANGE, BKCOLOR_RED, BKCOLOR_YELLOW,
    BKCOLOR_GREEN, BKCOLOR_BLUE, BKCOLOR_VIOLET, BKCOLOR_PURPLE, BKCOLOR_WHITE,
    BKCOLOR_BLACK


proc ppm_bk_color_from_color*(color: pixel; maxval: pixval): bk_color {.cdecl,
    importc: "ppm_bk_color_from_color", dynlib: netpbm.}
proc ppm_color_from_bk_color*(bkColor: bk_color; maxval: pixval): pixel {.cdecl,
    importc: "ppm_color_from_bk_color", dynlib: netpbm.}
proc ppm_bk_color_from_name*(name: cstring): bk_color {.cdecl,
    importc: "ppm_bk_color_from_name", dynlib: netpbm.}
proc ppm_name_from_bk_color*(bkColor: bk_color): cstring {.cdecl,
    importc: "ppm_name_from_bk_color", dynlib: netpbm.}