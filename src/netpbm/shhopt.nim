import pm_config

type
  optArgType* {.size: sizeof(cint).} = enum
    OPT_END, OPT_FLAG, OPT_STRING, OPT_INT, OPT_UINT, OPT_LONG, OPT_ULONG, OPT_FLOAT,
    OPT_STRINGLIST, OPT_NAMELIST
  optStruct* {.bycopy.} = object
    shortName*: char
    longName*: cstring
    `type`*: optArgType
    arg*: pointer
    flags*: cint

  optEntry* {.bycopy.} = object
    shortName*: char
    longName*: cstring
    `type`*: optArgType
    arg*: pointer
    specified*: ptr cuint
    flags*: cint

  optStruct2* {.bycopy.} = object
    short_allowed*: cuchar
    allowNegNum*: cuchar
    opt_table*: ptr optStruct

  optStruct3* {.bycopy.} = object
    short_allowed*: cuchar
    allowNegNum*: cuchar
    opt_table*: ptr optEntry



type
  optNameValue* {.bycopy.} = object
    name*: cstring
    value*: cstring


proc pm_optSetFatalFunc*(f: proc (a2: cstring) {.cdecl, varargs.}) {.cdecl,
    importc: "pm_optSetFatalFunc", dynlib: netpbm.}
proc pm_optParseOptions*(argc: ptr cint; argv: ptr cstring; opt: ptr optStruct;
                        allowNegNum: cint) {.cdecl, importc: "pm_optParseOptions",
    dynlib: netpbm.}
proc pm_optParseOptions2*(argc_p: ptr cint; argv: ptr cstring; opt: optStruct2;
                         flags: culong) {.cdecl, importc: "pm_optParseOptions2",
                                        dynlib: netpbm.}
proc pm_optParseOptions3*(argc_p: ptr cint; argv: ptr cstring; opt: optStruct3;
                         optStructSize: cuint; flags: culong) {.cdecl,
    importc: "pm_optParseOptions3", dynlib: netpbm.}
proc pm_optDestroyNameValueList*(list: ptr optNameValue) {.cdecl,
    importc: "pm_optDestroyNameValueList", dynlib: netpbm.}