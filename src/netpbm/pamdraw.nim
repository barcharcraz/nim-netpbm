import pm_config
import pm
import pam
type
  pamd_point* {.bycopy.} = object
    x*: cint
    y*: cint


proc pamd_makePoint*(x: cint; y: cint): pamd_point {.inline, cdecl.} =
  var p: pamd_point
  p.x = x
  p.y = y
  return p

proc pamd_validateCoord*(c: cint) {.cdecl, importc: "pamd_validateCoord",
                                 dynlib: netpbm.}
proc pamd_validatePoint*(p: pamd_point) {.cdecl, importc: "pamd_validatePoint",
                                       dynlib: netpbm.}
type
  pamd_pathlegtype* {.size: sizeof(cint).} = enum
    PAMD_PATHLEG_LINE


type
  pamd_linelegparms* {.bycopy.} = object
    `end`*: pamd_point

  INNER_C_UNION_3338057505* {.bycopy.} = object {.union.}
    linelegparms*: pamd_linelegparms

  pamd_pathleg* {.bycopy.} = object
    `type`*: pamd_pathlegtype
    u*: INNER_C_UNION_3338057505

  pamd_path* {.bycopy.} = object
    version*: cuint
    begPoint*: pamd_point
    legCount*: cuint
    legSize*: csize
    legs*: ptr pamd_pathleg

  pamd_drawproc* = proc (a2: ptr ptr `tuple`; a3: cuint; a4: cuint; a5: cuint; a6: sample;
                      a7: pamd_point; a8: pointer) {.cdecl.}

var pamd_point_drawproc* {.importc: "pamd_point_drawproc", dynlib: netpbm.}: pamd_drawproc

proc pamd_setlinetype*(`type`: cint): cint {.cdecl, importc: "pamd_setlinetype",
    dynlib: netpbm.}
proc pamd_setlineclip*(clip: cint): cint {.cdecl, importc: "pamd_setlineclip",
                                       dynlib: netpbm.}
proc pamd_line*(tuples: ptr ptr `tuple`; cols: cint; rows: cint; depth: cint;
               maxval: sample; p0: pamd_point; p1: pamd_point;
               drawProc: pamd_drawproc; clientdata: pointer) {.cdecl,
    importc: "pamd_line", dynlib: netpbm.}
proc pamd_spline3*(tuples: ptr ptr `tuple`; cols: cint; rows: cint; depth: cint;
                  maxval: sample; p0: pamd_point; p1: pamd_point; p2: pamd_point;
                  drawProc: pamd_drawproc; clientdata: pointer) {.cdecl,
    importc: "pamd_spline3", dynlib: netpbm.}
proc pamd_polyspline*(tuples: ptr ptr `tuple`; cols: cuint; rows: cuint; depth: cuint;
                     maxval: sample; p0: pamd_point; nc: cuint; c: ptr pamd_point;
                     p1: pamd_point; drawProc: pamd_drawproc; clientdata: pointer) {.
    cdecl, importc: "pamd_polyspline", dynlib: netpbm.}
proc pamd_spline4*(tuples: ptr ptr `tuple`; cols: cuint; rows: cuint; depth: cuint;
                  maxval: sample; endPt0: pamd_point; endPt1: pamd_point;
                  ctlPt0: pamd_point; ctlPt1: pamd_point; drawProc: pamd_drawproc;
                  clientdata: pointer) {.cdecl, importc: "pamd_spline4",
                                       dynlib: netpbm.}
proc pamd_circle*(tuples: ptr ptr `tuple`; cols: cuint; rows: cuint; depth: cuint;
                 maxval: sample; center: pamd_point; radius: cuint;
                 drawProc: pamd_drawproc; clientData: pointer) {.cdecl,
    importc: "pamd_circle", dynlib: netpbm.}
proc pamd_filledrectangle*(tuples: ptr ptr `tuple`; cols: cint; rows: cint; depth: cint;
                          maxval: sample; left: cint; top: cint; width: cint;
                          height: cint; drawProc: pamd_drawproc; clientdata: pointer) {.
    cdecl, importc: "pamd_filledrectangle", dynlib: netpbm.}
proc pamd_fill_path*(tuples: ptr ptr `tuple`; cols: cint; rows: cint; depth: cint;
                    maxval: sample; pathP: ptr pamd_path; color: `tuple`) {.cdecl,
    importc: "pamd_fill_path", dynlib: netpbm.}
type
  fillobj* {.bycopy.} = object
  

proc pamd_fill_create*(): ptr fillobj {.cdecl, importc: "pamd_fill_create",
                                    dynlib: netpbm.}
proc pamd_fill_destroy*(fillObjP: ptr fillobj) {.cdecl, importc: "pamd_fill_destroy",
    dynlib: netpbm.}
proc pamd_fill_drawproc*(tuples: ptr ptr `tuple`; cols: cuint; rows: cuint; depth: cuint;
                        maxval: sample; p: pamd_point; clientdata: pointer) {.cdecl,
    importc: "pamd_fill_drawproc", dynlib: netpbm.}
proc pamd_fill*(tuples: ptr ptr `tuple`; cols: cint; rows: cint; depth: cint;
               maxval: sample; fillObjP: ptr fillobj; drawProc: pamd_drawproc;
               clientdata: pointer) {.cdecl, importc: "pamd_fill", dynlib: netpbm.}
proc pamd_text*(tuples: ptr ptr `tuple`; cols: cint; rows: cint; depth: cint;
               maxval: sample; pos: pamd_point; height: cint; angle: cint;
               sArg: cstring; drawProc: pamd_drawproc; clientdata: pointer) {.cdecl,
    importc: "pamd_text", dynlib: netpbm.}
proc pamd_text_box*(height: cint; angle: cint; s: cstring; leftP: ptr cint;
                   topP: ptr cint; rightP: ptr cint; bottomP: ptr cint) {.cdecl,
    importc: "pamd_text_box", dynlib: netpbm.}