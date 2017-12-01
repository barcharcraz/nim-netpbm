import pm
import pm_config
type
  sample* = culong
  pam* {.bycopy.} = object
    size*: cuint
    len*: cuint
    file*: ptr FILE
    format*: cint
    plainformat*: cuint
    height*: cint
    width*: cint
    depth*: cuint
    maxval*: sample
    bytes_per_sample*: cuint
    tuple_type*: array[256, char]
    allocation_depth*: cuint
    comment_p*: cstringArray
    visual*: cint
    color_depth*: cuint
    have_opacity*: cint
    opacity_plane*: cuint

  `tuple`* = ptr sample
  pamtuples* {.bycopy.} = object
    pamP*: ptr pam
    tuplesP*: ptr ptr ptr `tuple`

  pnm_transformMap* = ptr cfloat

proc pnm_bytespersample*(maxval: sample): cuint {.cdecl,
    importc: "pnm_bytespersample", dynlib: netpbm.}
proc pnm_tupleequal*(pamP: ptr pam; comparand: `tuple`; comparator: `tuple`): cint {.
    cdecl, importc: "pnm_tupleequal", dynlib: netpbm.}
proc pnm_assigntuple*(pamP: ptr pam; dest: `tuple`; source: `tuple`) {.cdecl,
    importc: "pnm_assigntuple", dynlib: netpbm.}
proc pnm_scalesample*(source: sample; oldmaxval: sample; newmaxval: sample): sample {.
    inline, cdecl.} =
  if oldmaxval == newmaxval: return source
  else: return (source * newmaxval + (oldmaxval div 2)) div oldmaxval
  
proc pnm_scaletuple*(pamP: ptr pam; dest: `tuple`; source: `tuple`; newmaxval: sample) {.
    cdecl, importc: "pnm_scaletuple", dynlib: netpbm.}
proc pnm_scaletuplerow*(pamP: ptr pam; destRow: ptr `tuple`; sourceRow: ptr `tuple`;
                       newMaxval: sample) {.cdecl, importc: "pnm_scaletuplerow",
    dynlib: netpbm.}
proc pnm_maketuplergb*(pamP: ptr pam; `tuple`: `tuple`) {.cdecl,
    importc: "pnm_maketuplergb", dynlib: netpbm.}
proc pnm_makerowrgb*(pamP: ptr pam; tuplerow: ptr `tuple`) {.cdecl,
    importc: "pnm_makerowrgb", dynlib: netpbm.}
proc pnm_makearrayrgb*(pamP: ptr pam; tuples: ptr ptr `tuple`) {.cdecl,
    importc: "pnm_makearrayrgb", dynlib: netpbm.}
proc pnm_makerowrgba*(pamP: ptr pam; tuplerow: ptr `tuple`) {.cdecl,
    importc: "pnm_makerowrgba", dynlib: netpbm.}
proc pnm_addopacityrow*(pamP: ptr pam; tuplerow: ptr `tuple`) {.cdecl,
    importc: "pnm_addopacityrow", dynlib: netpbm.}
proc pnm_getopacity*(pamP: ptr pam; haveOpacityP: ptr cint; opacityPlaneP: ptr cuint) {.
    cdecl, importc: "pnm_getopacity", dynlib: netpbm.}
proc pnm_createBlackTuple*(pamP: ptr pam; blackTupleP: ptr `tuple`) {.cdecl,
    importc: "pnm_createBlackTuple", dynlib: netpbm.}
proc pnm_allocpamtuple*(pamP: ptr pam): `tuple` {.cdecl, importc: "pnm_allocpamtuple",
    dynlib: netpbm.}
proc pnm_allocpamrow*(pamP: ptr pam): ptr `tuple` {.cdecl, importc: "pnm_allocpamrow",
    dynlib: netpbm.}
proc pnm_allocpamarray*(pamP: ptr pam): ptr ptr `tuple` {.cdecl,
    importc: "pnm_allocpamarray", dynlib: netpbm.}
proc pnm_freepamarray*(tuplearray: ptr ptr `tuple`; pamP: ptr pam) {.cdecl,
    importc: "pnm_freepamarray", dynlib: netpbm.}
proc pnm_setminallocationdepth*(pamP: ptr pam; allocationDepth: cuint) {.cdecl,
    importc: "pnm_setminallocationdepth", dynlib: netpbm.}
proc pnm_setpamrow*(pam: ptr pam; tuplerow: ptr `tuple`; value: sample) {.cdecl,
    importc: "pnm_setpamrow", dynlib: netpbm.}
proc pnm_allocrowimage*(pamP: ptr pam): ptr cuchar {.cdecl,
    importc: "pnm_allocrowimage", dynlib: netpbm.}
proc pnm_freerowimage*(rowimage: ptr cuchar) {.cdecl, importc: "pnm_freerowimage",
    dynlib: netpbm.}
proc pnm_readpaminit*(file: File; pamP: ptr pam; size: cint) {.cdecl,
    importc: "pnm_readpaminit", dynlib: netpbm.}
proc pnm_readpamrow*(pamP: ptr pam; tuplerow: ptr `tuple`) {.cdecl,
    importc: "pnm_readpamrow", dynlib: netpbm.}
proc pnm_readpam*(file: File; pamP: ptr pam; size: cint): ptr ptr `tuple` {.cdecl,
    importc: "pnm_readpam", dynlib: netpbm.}
proc pnm_writepaminit*(pamP: ptr pam) {.cdecl, importc: "pnm_writepaminit",
                                    dynlib: netpbm.}
proc pnm_formatpamrow*(pamP: ptr pam; tuplerow: ptr `tuple`; outbuf: ptr cuchar;
                      rowSizeP: ptr cuint) {.cdecl, importc: "pnm_formatpamrow",
    dynlib: netpbm.}
proc pnm_writepamrow*(pamP: ptr pam; tuplerow: ptr `tuple`) {.cdecl,
    importc: "pnm_writepamrow", dynlib: netpbm.}
proc pnm_writepamrowmult*(pamP: ptr pam; tuplerow: ptr `tuple`; rptcnt: cuint) {.cdecl,
    importc: "pnm_writepamrowmult", dynlib: netpbm.}
proc pnm_writepam*(pamP: ptr pam; tuplearray: ptr ptr `tuple`) {.cdecl,
    importc: "pnm_writepam", dynlib: netpbm.}
proc pnm_checkpam*(pamP: ptr pam; checkType: pm_check_type; retvalP: ptr pm_check_code) {.
    cdecl, importc: "pnm_checkpam", dynlib: netpbm.}
type
  samplen* = cfloat
  tuplen* = ptr samplen

proc pnm_allocpamrown*(pamP: ptr pam): ptr tuplen {.cdecl, importc: "pnm_allocpamrown",
    dynlib: netpbm.}
proc pnm_readpamrown*(pamP: ptr pam; tuplenrow: ptr tuplen) {.cdecl,
    importc: "pnm_readpamrown", dynlib: netpbm.}
proc pnm_writepamrown*(pamP: ptr pam; tuplenrow: ptr tuplen) {.cdecl,
    importc: "pnm_writepamrown", dynlib: netpbm.}
proc pnm_allocpamarrayn*(pamP: ptr pam): ptr ptr tuplen {.cdecl,
    importc: "pnm_allocpamarrayn", dynlib: netpbm.}
proc pnm_freepamarrayn*(tuplenarray: ptr ptr tuplen; pamP: ptr pam) {.cdecl,
    importc: "pnm_freepamarrayn", dynlib: netpbm.}
proc pnm_readpamn*(file: File; pamP: ptr pam; size: cint): ptr ptr tuplen {.cdecl,
    importc: "pnm_readpamn", dynlib: netpbm.}
proc pnm_writepamn*(pamP: ptr pam; tuplenarray: ptr ptr tuplen) {.cdecl,
    importc: "pnm_writepamn", dynlib: netpbm.}
proc pnm_normalizetuple*(pamP: ptr pam; `tuple`: `tuple`; tuplen: tuplen) {.cdecl,
    importc: "pnm_normalizetuple", dynlib: netpbm.}
proc pnm_unnormalizetuple*(pamP: ptr pam; tuplen: tuplen; `tuple`: `tuple`) {.cdecl,
    importc: "pnm_unnormalizetuple", dynlib: netpbm.}
proc pnm_normalizeRow*(pamP: ptr pam; tuplerow: ptr `tuple`;
                      transform: ptr pnm_transformMap; tuplenrow: ptr tuplen) {.cdecl,
    importc: "pnm_normalizeRow", dynlib: netpbm.}
proc pnm_unnormalizeRow*(pamP: ptr pam; tuplenrow: ptr tuplen;
                        transform: ptr pnm_transformMap; tuplerow: ptr `tuple`) {.
    cdecl, importc: "pnm_unnormalizeRow", dynlib: netpbm.}
proc pnm_gammarown*(pamP: ptr pam; row: ptr tuplen) {.cdecl, importc: "pnm_gammarown",
    dynlib: netpbm.}
proc pnm_ungammarown*(pamP: ptr pam; row: ptr tuplen) {.cdecl,
    importc: "pnm_ungammarown", dynlib: netpbm.}
proc pnm_applyopacityrown*(pamP: ptr pam; tuplenrow: ptr tuplen) {.cdecl,
    importc: "pnm_applyopacityrown", dynlib: netpbm.}
proc pnm_unapplyopacityrown*(pamP: ptr pam; tuplenrow: ptr tuplen) {.cdecl,
    importc: "pnm_unapplyopacityrown", dynlib: netpbm.}
proc pnm_creategammatransform*(pamP: ptr pam): ptr pnm_transformMap {.cdecl,
    importc: "pnm_creategammatransform", dynlib: netpbm.}
proc pnm_freegammatransform*(transform: ptr pnm_transformMap; pamP: ptr pam) {.cdecl,
    importc: "pnm_freegammatransform", dynlib: netpbm.}
proc pnm_createungammatransform*(pamP: ptr pam): ptr pnm_transformMap {.cdecl,
    importc: "pnm_createungammatransform", dynlib: netpbm.}
proc pnm_parsecolor*(colorname: cstring; maxval: sample): `tuple` {.cdecl,
    importc: "pnm_parsecolor", dynlib: netpbm.}
proc pnm_parsecolorn*(colorname: cstring): tuplen {.cdecl,
    importc: "pnm_parsecolorn", dynlib: netpbm.}
proc pnm_colorname*(pamP: ptr pam; color: `tuple`; hexok: cint): cstring {.cdecl,
    importc: "pnm_colorname", dynlib: netpbm.}
var pnm_lumin_factor* {.importc: "pnm_lumin_factor", dynlib: netpbm.}: array[3, cdouble]

proc pnm_YCbCrtuple*(`tuple`: `tuple`; YP: ptr cdouble; CbP: ptr cdouble;
                    CrP: ptr cdouble) {.cdecl, importc: "pnm_YCbCrtuple",
                                     dynlib: netpbm.}
proc pnm_YCbCr_to_rgbtuple*(pamP: ptr pam; `tuple`: `tuple`; Y: cdouble; Cb: cdouble;
                           Cr: cdouble; overflowP: ptr cint) {.cdecl,
    importc: "pnm_YCbCr_to_rgbtuple", dynlib: netpbm.}
proc pnm_backgroundtuple*(pamP: ptr pam; tuples: ptr ptr `tuple`): `tuple` {.cdecl,
    importc: "pnm_backgroundtuple", dynlib: netpbm.}
proc pm_feed_from_pamtuples*(pipeToFeedFd: cint; feederParm: pointer) {.cdecl,
    importc: "pm_feed_from_pamtuples", dynlib: netpbm.}
proc pm_accept_to_pamtuples*(pipeToSuckFd: cint; accepterParm: pointer) {.cdecl,
    importc: "pm_accept_to_pamtuples", dynlib: netpbm.}