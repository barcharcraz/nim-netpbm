import pm_config
when defined(windows):
    import winlean
else:
    import posix

type
  pm_pixelcoord* {.bycopy.} = object
    row*: cuint
    col*: cuint


var pm_plain_output* {.importc: "pm_plain_output", dynlib: netpbm.}: cint

var pm_progname* {.importc: "pm_progname", dynlib: netpbm.}: cstring

proc pm_init*(progname: cstring; flags: cuint) {.cdecl, importc: "pm_init",
    dynlib: netpbm.}
proc pm_proginit*(argcP: ptr cint; argv: ptr cstring) {.cdecl, importc: "pm_proginit",
    dynlib: netpbm.}
proc pm_setMessage*(newState: cint; oldStateP: ptr cint) {.cdecl,
    importc: "pm_setMessage", dynlib: netpbm.}
proc pm_getMessage*(): cint {.cdecl, importc: "pm_getMessage", dynlib: netpbm.}
proc pm_tmpfile*(): ptr FILE {.cdecl, importc: "pm_tmpfile", dynlib: netpbm.}
proc pm_tmpfile_fd*(): cint {.cdecl, importc: "pm_tmpfile_fd", dynlib: netpbm.}
proc pm_make_tmpfile*(filePP: ptr ptr FILE; filenameP: cstringArray) {.cdecl,
    importc: "pm_make_tmpfile", dynlib: netpbm.}
proc pm_make_tmpfile_fd*(fdP: ptr cint; filenameP: cstringArray) {.cdecl,
    importc: "pm_make_tmpfile_fd", dynlib: netpbm.}
proc pm_nextimage*(file: ptr FILE; eofP: ptr cint) {.cdecl, importc: "pm_nextimage",
    dynlib: netpbm.}
proc pm_allocarray*(cols: cint; rows: cint; size: cint): cstringArray {.cdecl,
    importc: "pm_allocarray", dynlib: netpbm.}
proc pm_allocrow*(cols: cuint; size: cuint): pointer {.cdecl, importc: "pm_allocrow",
    dynlib: netpbm.}
proc pm_freearray*(its: cstringArray; rows: cint) {.cdecl, importc: "pm_freearray",
    dynlib: netpbm.}
proc pm_freerow*(row: pointer) {.cdecl, importc: "pm_freerow", dynlib: netpbm.}
proc pm_keymatch*(str: cstring; keyword: cstring; minchars: cint): cint {.cdecl,
    importc: "pm_keymatch", dynlib: netpbm.}
proc pm_maxvaltobits*(maxval: cint): cint {.cdecl, importc: "pm_maxvaltobits",
                                        dynlib: netpbm.}
proc pm_bitstomaxval*(bits: cint): cint {.cdecl, importc: "pm_bitstomaxval",
                                      dynlib: netpbm.}
proc pm_lcm*(x: cuint; y: cuint; z: cuint; limit: cuint): cuint {.cdecl, importc: "pm_lcm",
    dynlib: netpbm.}
proc pm_setjmpbuf*(jmpbufP: pointer) {.cdecl, importc: "pm_setjmpbuf",
                                       dynlib: netpbm.}
proc pm_setjmpbufsave*(jmpbufP: pointer; oldJmpbufPP: ptr pointer) {.cdecl,
    importc: "pm_setjmpbufsave", dynlib: netpbm.}
proc pm_longjmp*() {.cdecl, importc: "pm_longjmp", dynlib: netpbm.}
proc pm_fork*(iAmParentP: ptr cint; childPidP: ptr Pid; errorP: cstringArray) {.cdecl,
    importc: "pm_fork", dynlib: netpbm.}
proc pm_waitpid*(pid: Pid; statusP: ptr cint; options: cint; exitedPidP: ptr Pid;
                errorP: cstringArray) {.cdecl, importc: "pm_waitpid", dynlib: netpbm.}
proc pm_waitpidSimple*(pid: Pid) {.cdecl, importc: "pm_waitpidSimple",
                                  dynlib: netpbm.}
type
  pm_usermessagefn* = proc (msg: cstring) {.cdecl.}

proc pm_setusermessagefn*(fn: ptr pm_usermessagefn) {.cdecl,
    importc: "pm_setusermessagefn", dynlib: netpbm.}
type
  pm_usererrormsgfn* = proc (msg: cstring) {.cdecl.}

proc pm_setusererrormsgfn*(fn: ptr pm_usererrormsgfn) {.cdecl,
    importc: "pm_setusererrormsgfn", dynlib: netpbm.}
proc pm_have_float_format*(): cint {.cdecl, importc: "pm_have_float_format",
                                  dynlib: netpbm.}
proc pm_usage*(usage: ptr char) {.cdecl, importc: "pm_usage", dynlib: netpbm.}
proc pm_openr*(name: cstring): ptr FILE {.cdecl, importc: "pm_openr", dynlib: netpbm.}
proc pm_openw*(name: cstring): ptr FILE {.cdecl, importc: "pm_openw", dynlib: netpbm.}
proc pm_openr_seekable*(name: ptr char): ptr FILE {.cdecl,
    importc: "pm_openr_seekable", dynlib: netpbm.}
proc pm_close*(f: ptr FILE) {.cdecl, importc: "pm_close", dynlib: netpbm.}
proc pm_closer*(f: ptr FILE) {.cdecl, importc: "pm_closer", dynlib: netpbm.}
proc pm_closew*(f: ptr FILE) {.cdecl, importc: "pm_closew", dynlib: netpbm.}
proc pm_readchar*(ifP: ptr FILE; cP: cstring) {.cdecl, importc: "pm_readchar",
    dynlib: netpbm.}
proc pm_readcharu*(ifP: ptr FILE; cP: ptr cuchar) {.inline, cdecl.} =
  pm_readchar(ifP, cast[cstring](cP))

proc pm_writechar*(ofP: ptr FILE; c: char) {.cdecl, importc: "pm_writechar",
                                       dynlib: netpbm.}
proc pm_writecharu*(ofP: ptr FILE; c: cuchar) {.inline, cdecl.} =
  pm_writechar(ofP, cast[char](c))

proc pm_readbigshort*(ifP: ptr FILE; sP: ptr cshort): cint {.cdecl,
    importc: "pm_readbigshort", dynlib: netpbm.}
proc pm_readbigshortu*(ifP: ptr FILE; sP: ptr cushort): cint {.inline, cdecl.} =
  return pm_readbigshort(ifP, cast[ptr cshort](sP))

proc pm_writebigshort*(ofP: ptr FILE; s: cshort): cint {.cdecl,
    importc: "pm_writebigshort", dynlib: netpbm.}
proc pm_writebigshortu*(ofP: ptr FILE; s: cushort): cint {.inline, cdecl.} =
  return pm_writebigshort(ofP, cast[cshort](s))

proc pm_readbiglong*(ifP: ptr FILE; lP: ptr clong): cint {.cdecl,
    importc: "pm_readbiglong", dynlib: netpbm.}
proc pm_readbiglongu*(ifP: ptr FILE; lP: ptr culong): cint {.inline, cdecl.} =
  return pm_readbiglong(ifP, cast[ptr clong](lP))

proc pm_readbiglong2*(ifP: ptr FILE; lP: ptr int32): cint {.cdecl,
    importc: "pm_readbiglong2", dynlib: netpbm.}
proc pm_readbiglongu2*(ifP: ptr FILE; lP: ptr uint32): cint {.inline, cdecl.} =
  return pm_readbiglong2(ifP, cast[ptr int32](lP))

proc pm_writebiglong*(ofP: ptr FILE; l: clong): cint {.cdecl,
    importc: "pm_writebiglong", dynlib: netpbm.}
proc pm_writebiglongu*(ofP: ptr FILE; l: culong): cint {.inline, cdecl.} =
  return pm_writebiglong(ofP, cast[clong](l))

proc pm_readlittleshort*(ifP: ptr FILE; sP: ptr cshort): cint {.cdecl,
    importc: "pm_readlittleshort", dynlib: netpbm.}
proc pm_readlittleshortu*(ifP: ptr FILE; sP: ptr cushort): cint {.inline, cdecl.} =
  return pm_readlittleshort(ifP, cast[ptr cshort](sP))

proc pm_writelittleshort*(ofP: ptr FILE; s: cshort): cint {.cdecl,
    importc: "pm_writelittleshort", dynlib: netpbm.}
proc pm_writelittleshortu*(ofP: ptr FILE; s: cushort): cint {.inline, cdecl.} =
  return pm_writelittleshort(ofP, cast[cshort](s))

proc pm_readlittlelong*(ifP: ptr FILE; lP: ptr clong): cint {.cdecl,
    importc: "pm_readlittlelong", dynlib: netpbm.}
proc pm_readlittlelongu*(ifP: ptr FILE; lP: ptr culong): cint {.inline, cdecl.} =
  return pm_readlittlelong(ifP, cast[ptr clong](lP))

proc pm_readlittlelong2*(ifP: ptr FILE; lP: ptr int32): cint {.cdecl,
    importc: "pm_readlittlelong2", dynlib: netpbm.}
proc pm_readlittlelong2u*(ifP: ptr FILE; lP: ptr uint32): cint {.inline, cdecl.} =
  return pm_readlittlelong2(ifP, cast[ptr int32](lP))

proc pm_writelittlelong*(ofP: ptr FILE; l: clong): cint {.cdecl,
    importc: "pm_writelittlelong", dynlib: netpbm.}
proc pm_writelittlelongu*(ofP: ptr FILE; l: culong): cint {.inline, cdecl.} =
  return pm_writelittlelong(ofP, cast[clong](l))

proc pm_readmagicnumber*(ifP: ptr FILE): cint {.cdecl, importc: "pm_readmagicnumber",
    dynlib: netpbm.}
proc pm_read_unknown_size*(ifP: ptr FILE; buf: ptr clong): cstring {.cdecl,
    importc: "pm_read_unknown_size", dynlib: netpbm.}
proc pm_bs_short*(s: cshort): cshort {.cdecl, importc: "pm_bs_short", dynlib: netpbm.}
proc pm_bs_long*(l: clong): clong {.cdecl, importc: "pm_bs_long", dynlib: netpbm.}
proc pm_tell*(fileP: ptr FILE): cuint {.cdecl, importc: "pm_tell", dynlib: netpbm.}
proc pm_tell2*(fileP: ptr FILE; fileposP: pointer; fileposSize: cuint) {.cdecl,
    importc: "pm_tell2", dynlib: netpbm.}
proc pm_seek2*(fileP: ptr FILE; fileposP: ptr pm_filepos; fileposSize: cuint) {.cdecl,
    importc: "pm_seek2", dynlib: netpbm.}
proc pm_seek*(fileP: ptr FILE; filepos: culong) {.cdecl, importc: "pm_seek",
    dynlib: netpbm.}
type
  pm_check_code* {.size: sizeof(cint).} = enum
    PM_CHECK_OK, PM_CHECK_UNKNOWN_TYPE, PM_CHECK_TOO_LONG, PM_CHECK_UNCHECKABLE,
    PM_CHECK_TOO_SHORT


type
  pm_check_type* {.size: sizeof(cint).} = enum
    PM_CHECK_BASIC


proc pm_check*(file: ptr FILE; check_type: pm_check_type;
              need_raster_size: pm_filepos; retval_p: ptr pm_check_code) {.cdecl,
    importc: "pm_check", dynlib: netpbm.}
proc pm_drain*(fileP: ptr FILE; limit: cuint; bytesReadP: ptr cuint) {.cdecl,
    importc: "pm_drain", dynlib: netpbm.}
proc pm_arg0toprogname*(arg0: ptr char): cstring {.cdecl,
    importc: "pm_arg0toprogname", dynlib: netpbm.}
proc pm_randseed*(): cuint {.cdecl, importc: "pm_randseed", dynlib: netpbm.}
proc pm_parse_width*(arg: cstring): cuint {.cdecl, importc: "pm_parse_width",
                                        dynlib: netpbm.}
proc pm_parse_height*(arg: cstring): cuint {.cdecl, importc: "pm_parse_height",
    dynlib: netpbm.}
proc malloc2*(a2: cint; a3: cint): pointer {.cdecl, importc: "malloc2", dynlib: netpbm.}
proc malloc3*(a2: cint; a3: cint; a4: cint): pointer {.cdecl, importc: "malloc3",
    dynlib: netpbm.}
proc n_overflow2*(a2: cint; a3: cint) {.cdecl, importc: "__overflow2", dynlib: netpbm.}
proc overflow3*(a2: cint; a3: cint; a4: cint) {.cdecl, importc: "overflow3",
    dynlib: netpbm.}
proc overflow_add*(a2: cint; a3: cint) {.cdecl, importc: "overflow_add", dynlib: netpbm.}