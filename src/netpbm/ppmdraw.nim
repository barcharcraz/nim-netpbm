import pm_config
import pm
import ppm
type
  ppmd_point* {.bycopy.} = object
    x*: cint
    y*: cint


proc ppmd_makePoint*(x: cint; y: cint): ppmd_point {.inline, cdecl.} =
  var p: ppmd_point
  p.x = x
  p.y = y
  return p

proc ppmd_validateCoord*(c: cint) {.cdecl, importc: "ppmd_validateCoord",
                                 dynlib: netpbm.}
proc ppmd_validatePoint*(p: ppmd_point) {.cdecl, importc: "ppmd_validatePoint",
                                       dynlib: netpbm.}
type
  ppmd_pathlegtype* {.size: sizeof(cint).} = enum
    PPMD_PATHLEG_LINE


type
  ppmd_linelegparms* {.bycopy.} = object
    `end`*: ppmd_point

  INNER_C_UNION_2341752914* {.bycopy.} = object {.union.}
    linelegparms*: ppmd_linelegparms

  ppmd_pathleg* {.bycopy.} = object
    `type`*: ppmd_pathlegtype
    u*: INNER_C_UNION_2341752914


proc ppmd_makeLineLeg*(point: ppmd_point): ppmd_pathleg {.cdecl,
    importc: "ppmd_makeLineLeg", dynlib: netpbm.}
type
  ppmd_path* {.bycopy.} = object
    version*: cuint
    begPoint*: ppmd_point
    legCount*: cuint
    legSize*: csize
    legs*: ptr ppmd_pathleg

  ppmd_pathbuilder* {.bycopy.} = object
    path*: ppmd_path
    begIsSet*: bool
    legsAllocSize*: cuint
    legsAreAutoAllocated*: bool


proc ppmd_pathbuilder_create*(): ptr ppmd_pathbuilder {.cdecl,
    importc: "ppmd_pathbuilder_create", dynlib: netpbm.}
proc ppmd_pathbuilder_destroy*(pathBuilderP: ptr ppmd_pathbuilder) {.cdecl,
    importc: "ppmd_pathbuilder_destroy", dynlib: netpbm.}
proc ppmd_pathbuilder_setLegArray*(pathBuilderP: ptr ppmd_pathbuilder;
                                  legs: ptr ppmd_pathleg; legCount: cuint) {.cdecl,
    importc: "ppmd_pathbuilder_setLegArray", dynlib: netpbm.}
proc ppmd_pathbuilder_preallocLegArray*(pathBuilderP: ptr ppmd_pathbuilder;
                                       legCount: cuint) {.cdecl,
    importc: "ppmd_pathbuilder_preallocLegArray", dynlib: netpbm.}
proc ppmd_pathbuilder_setBegPoint*(pathBuilderP: ptr ppmd_pathbuilder;
                                  begPoint: ppmd_point) {.cdecl,
    importc: "ppmd_pathbuilder_setBegPoint", dynlib: netpbm.}
proc ppmd_pathbuilder_addLineLeg*(pathBuilderP: ptr ppmd_pathbuilder;
                                 leg: ppmd_pathleg) {.cdecl,
    importc: "ppmd_pathbuilder_addLineLeg", dynlib: netpbm.}
proc ppmd_pathbuilder_pathP*(pathBuilderP: ptr ppmd_pathbuilder): ptr ppmd_path {.
    cdecl, importc: "ppmd_pathbuilder_pathP", dynlib: netpbm.}
type
  ppmd_drawprocp* = proc (a2: ptr ptr pixel; a3: cuint; a4: cuint; a5: pixval;
                       a6: ppmd_point; a7: pointer) {.cdecl.}
  ppmd_drawproc* = proc (a2: ptr ptr pixel; a3: cint; a4: cint; a5: pixval; a6: cint; a7: cint;
                      a8: pointer) {.cdecl.}

var ppmd_point_drawprocp* {.importc: "ppmd_point_drawprocp", dynlib: netpbm.}: ppmd_drawprocp

var ppmd_point_drawproc* {.importc: "ppmd_point_drawproc", dynlib: netpbm.}: ppmd_drawproc

proc ppmd_setlinetype*(`type`: cint): cint {.cdecl, importc: "ppmd_setlinetype",
    dynlib: netpbm.}
proc ppmd_setlineclip*(clip: cint): cint {.cdecl, importc: "ppmd_setlineclip",
                                       dynlib: netpbm.}
proc ppmd_linep*(pixels: ptr ptr pixel; cols: cint; rows: cint; maxval: pixval;
                p0: ppmd_point; p1: ppmd_point; drawProc: ppmd_drawprocp;
                clientdata: pointer) {.cdecl, importc: "ppmd_linep", dynlib: netpbm.}
proc ppmd_line*(pixels: ptr ptr pixel; cols: cint; rows: cint; maxval: pixval; x0: cint;
               y0: cint; x1: cint; y1: cint; drawproc: ppmd_drawproc;
               clientdata: pointer) {.cdecl, importc: "ppmd_line", dynlib: netpbm.}
proc ppmd_spline3p*(pixels: ptr ptr pixel; cols: cint; rows: cint; maxval: pixval;
                   p0: ppmd_point; p1: ppmd_point; p2: ppmd_point;
                   drawProc: ppmd_drawprocp; clientdata: pointer) {.cdecl,
    importc: "ppmd_spline3p", dynlib: netpbm.}
proc ppmd_spline3*(pixels: ptr ptr pixel; cols: cint; rows: cint; maxval: pixval; x0: cint;
                  y0: cint; x1: cint; y1: cint; x2: cint; y2: cint;
                  drawproc: ppmd_drawproc; clientdata: pointer) {.cdecl,
    importc: "ppmd_spline3", dynlib: netpbm.}
proc ppmd_polysplinep*(pixels: ptr ptr pixel; cols: cuint; rows: cuint; maxval: pixval;
                      p0: ppmd_point; nc: cuint; c: ptr ppmd_point; p1: ppmd_point;
                      drawProc: ppmd_drawprocp; clientdata: pointer) {.cdecl,
    importc: "ppmd_polysplinep", dynlib: netpbm.}
proc ppmd_polyspline*(pixels: ptr ptr pixel; cols: cint; rows: cint; maxval: pixval;
                     x0: cint; y0: cint; nc: cint; xc: ptr cint; yc: ptr cint; x1: cint;
                     y1: cint; drawProc: ppmd_drawproc; clientdata: pointer) {.cdecl,
    importc: "ppmd_polyspline", dynlib: netpbm.}
proc ppmd_spline4p*(pixels: ptr ptr pixel; cols: cuint; rows: cuint; maxval: pixval;
                   endPt0: ppmd_point; endPt1: ppmd_point; ctlPt0: ppmd_point;
                   ctlPt1: ppmd_point; drawproc: ppmd_drawprocp; clientdata: pointer) {.
    cdecl, importc: "ppmd_spline4p", dynlib: netpbm.}
proc ppmd_circlep*(pixels: ptr ptr pixel; cols: cuint; rows: cuint; maxval: pixval;
                  center: ppmd_point; radius: cuint; drawProc: ppmd_drawprocp;
                  clientData: pointer) {.cdecl, importc: "ppmd_circlep",
                                       dynlib: netpbm.}
proc ppmd_circle*(pixels: ptr ptr pixel; cols: cint; rows: cint; maxval: pixval; cx: cint;
                 cy: cint; radius: cint; drawProc: ppmd_drawproc; clientdata: pointer) {.
    cdecl, importc: "ppmd_circle", dynlib: netpbm.}
proc ppmd_filledrectangle*(pixels: ptr ptr pixel; cols: cint; rows: cint; maxval: pixval;
                          x: cint; y: cint; width: cint; height: cint;
                          drawproc: ppmd_drawproc; clientdata: pointer) {.cdecl,
    importc: "ppmd_filledrectangle", dynlib: netpbm.}
proc ppmd_fill_path*(pixels: ptr ptr pixel; cols: cint; rows: cint; maxval: pixval;
                    pathP: ptr ppmd_path; color: pixel) {.cdecl,
    importc: "ppmd_fill_path", dynlib: netpbm.}
type
  fillobj* {.bycopy.} = object
  

proc ppmd_fill_create*(): ptr fillobj {.cdecl, importc: "ppmd_fill_create",
                                    dynlib: netpbm.}
proc ppmd_fill_destroy*(fillObjP: ptr fillobj) {.cdecl, importc: "ppmd_fill_destroy",
    dynlib: netpbm.}
proc ppmd_fill_init*(): cstring {.cdecl, importc: "ppmd_fill_init", dynlib: netpbm.}
proc ppmd_fill_drawprocp*(pixels: ptr ptr pixel; cols: cuint; rows: cuint;
                         maxval: pixval; p: ppmd_point; clientdata: pointer) {.cdecl,
    importc: "ppmd_fill_drawprocp", dynlib: netpbm.}
proc ppmd_fill_drawproc*(pixels: ptr ptr pixel; cols: cint; rows: cint; maxval: pixval;
                        x: cint; y: cint; clientdata: pointer) {.cdecl,
    importc: "ppmd_fill_drawproc", dynlib: netpbm.}
proc ppmd_fill*(pixels: ptr ptr pixel; cols: cint; rows: cint; maxval: pixval;
               fh: ptr fillobj; drawProc: ppmd_drawproc; clientdata: pointer) {.cdecl,
    importc: "ppmd_fill", dynlib: netpbm.}
proc ppmd_textp*(pixels: ptr ptr pixel; cols: cint; rows: cint; maxval: pixval;
                pos: ppmd_point; height: cint; angle: cint; sArg: cstring;
                drawProc: ppmd_drawprocp; clientdata: pointer) {.cdecl,
    importc: "ppmd_textp", dynlib: netpbm.}
proc ppmd_text*(pixels: ptr ptr pixel; cols: cint; rows: cint; maxval: pixval; xpos: cint;
               ypos: cint; height: cint; angle: cint; sArg: cstring;
               drawProc: ppmd_drawproc; clientdata: pointer) {.cdecl,
    importc: "ppmd_text", dynlib: netpbm.}
proc ppmd_text_box*(height: cint; angle: cint; s: cstring; leftP: ptr cint;
                   topP: ptr cint; rightP: ptr cint; bottomP: ptr cint) {.cdecl,
    importc: "ppmd_text_box", dynlib: netpbm.}