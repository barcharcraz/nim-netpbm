
import pm_config
import pam
import ppm
type
  colornameFormat* {.size: sizeof(cint).} = enum
    PAM_COLORNAME_ENGLISH = 0, PAM_COLORNAME_HEXOK = 1


type
  colorfile_entry* {.bycopy.} = object
    r*: clong
    g*: clong
    b*: clong
    colorname*: cstring


proc pm_canonstr*(str: cstring) {.cdecl, importc: "pm_canonstr", dynlib: netpbm.}
proc pm_openColornameFile*(fileName: cstring; must_open: cint): ptr FILE {.cdecl,
    importc: "pm_openColornameFile", dynlib: netpbm.}
proc pm_colorget*(f: ptr FILE): colorfile_entry {.cdecl, importc: "pm_colorget",
    dynlib: netpbm.}
proc pm_parse_dictionary_namen*(colorname: ptr char; color: tuplen) {.cdecl,
    importc: "pm_parse_dictionary_namen", dynlib: netpbm.}
proc pm_parse_dictionary_name*(colorname: ptr char; maxval: pixval; closeOk: cint;
                              colorP: ptr pixel) {.cdecl,
    importc: "pm_parse_dictionary_name", dynlib: netpbm.}