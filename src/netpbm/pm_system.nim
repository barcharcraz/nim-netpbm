import pm_config

proc pm_system2_vp*(progName: cstring; argArray: cstringArray;
                   stdinFeeder: proc (a2: cint; a3: pointer) {.cdecl.};
                   feederParm: pointer;
                   stdoutAccepter: proc (a2: cint; a3: pointer) {.cdecl.};
                   accepterParm: pointer; termStatusP: ptr cint) {.cdecl,
    importc: "pm_system2_vp", dynlib: netpbm.}
proc pm_system2_lp*(progName: cstring;
                   stdinFeeder: proc (a2: cint; a3: pointer) {.cdecl.};
                   feederParm: pointer;
                   stdoutAccepter: proc (a2: cint; a3: pointer) {.cdecl.};
                   accepterParm: pointer; termStatusP: ptr cint) {.varargs, cdecl,
    importc: "pm_system2_lp", dynlib: netpbm.}
proc pm_system2*(stdinFeeder: proc (a2: cint; a3: pointer) {.cdecl.};
                feederParm: pointer;
                stdoutAccepter: proc (a2: cint; a3: pointer) {.cdecl.};
                accepterParm: pointer; shellCommand: cstring; termStatusP: ptr cint) {.
    cdecl, importc: "pm_system2", dynlib: netpbm.}
proc pm_system_vp*(progName: cstring; argArray: cstringArray;
                  stdinFeeder: proc (a2: cint; a3: pointer) {.cdecl.};
                  feederParm: pointer;
                  stdoutAccepter: proc (a2: cint; a3: pointer) {.cdecl.};
                  accepterParm: pointer) {.cdecl, importc: "pm_system_vp",
    dynlib: netpbm.}
proc pm_system_lp*(progName: cstring;
                  stdinFeeder: proc (a2: cint; a3: pointer) {.cdecl.};
                  feederParm: pointer;
                  stdoutAccepter: proc (a2: cint; a3: pointer) {.cdecl.};
                  accepterParm: pointer) {.varargs, cdecl, importc: "pm_system_lp",
    dynlib: netpbm.}
proc pm_system*(stdinFeeder: proc (a2: cint; a3: pointer) {.cdecl.};
               feederParm: pointer;
               stdoutAccepter: proc (a2: cint; a3: pointer) {.cdecl.};
               accepterParm: pointer; shellCommand: cstring) {.cdecl,
    importc: "pm_system", dynlib: netpbm.}
proc pm_termStatusDesc*(termStatus: cint): cstring {.cdecl,
    importc: "pm_termStatusDesc", dynlib: netpbm.}
proc pm_feed_null*(pipeToFeedFd: cint; feederParm: pointer) {.cdecl,
    importc: "pm_feed_null", dynlib: netpbm.}
proc pm_accept_null*(pipetosuckFd: cint; accepterParm: pointer) {.cdecl,
    importc: "pm_accept_null", dynlib: netpbm.}
type
  bufferDesc* {.bycopy.} = object
    size*: cuint
    buffer*: ptr cuchar
    bytesTransferredP*: ptr cuint

  pm_bufferDesc* = bufferDesc

proc pm_feed_from_memory*(pipeToFeedFd: cint; feederParm: pointer) {.cdecl,
    importc: "pm_feed_from_memory", dynlib: netpbm.}
proc pm_accept_to_memory*(pipetosuckFd: cint; accepterParm: pointer) {.cdecl,
    importc: "pm_accept_to_memory", dynlib: netpbm.}