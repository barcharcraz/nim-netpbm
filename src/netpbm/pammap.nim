import pm_config
import pm
import pam
import colorname
type
  tupleint* {.bycopy.} = object
    value*: cint
    `tuple`*: array[1, sample]

  tupletable* = ptr ptr tupleint
  tupletable2* {.bycopy.} = object
    size*: cuint
    table*: tupletable

  tupleint_list_item* {.bycopy.} = object
    next*: ptr tupleint_list_item
    tupleint*: tupleint

  tupleint_list* = ptr tupleint_list_item
  tuplehash* = ptr tupleint_list

proc pnm_hashtuple*(pamP: ptr pam; `tuple`: `tuple`): cuint {.cdecl,
    importc: "pnm_hashtuple", dynlib: netpbm.}
proc pnm_addtotuplehash*(pamP: ptr pam; tuplehash: tuplehash; `tuple`: `tuple`;
                        value: cint; fitsP: ptr cint) {.cdecl,
    importc: "pnm_addtotuplehash", dynlib: netpbm.}
proc pnm_addtuplefreqoccurrence*(pamP: ptr pam; value: `tuple`;
                                tuplefreqhash: tuplehash;
                                firstOccurrenceP: ptr cint) {.cdecl,
    importc: "pnm_addtuplefreqoccurrence", dynlib: netpbm.}
proc pnm_lookuptuple*(pamP: ptr pam; tuplehash: tuplehash; searchval: `tuple`;
                     foundP: ptr cint; retvalP: ptr cint) {.cdecl,
    importc: "pnm_lookuptuple", dynlib: netpbm.}
proc pnm_alloctupletable*(pamP: ptr pam; size: cuint): tupletable {.cdecl,
    importc: "pnm_alloctupletable", dynlib: netpbm.}
proc pnm_freetupletable*(pamP: ptr pam; tupletable: tupletable) {.cdecl,
    importc: "pnm_freetupletable", dynlib: netpbm.}
proc pnm_freetupletable2*(pamP: ptr pam; tupletable: tupletable2) {.cdecl,
    importc: "pnm_freetupletable2", dynlib: netpbm.}
proc pnm_createtuplehash*(): tuplehash {.cdecl, importc: "pnm_createtuplehash",
                                      dynlib: netpbm.}
proc pnm_destroytuplehash*(tuplehash: tuplehash) {.cdecl,
    importc: "pnm_destroytuplehash", dynlib: netpbm.}
proc pnm_computetuplefreqtable*(pamP: ptr pam; tupleArray: ptr ptr `tuple`;
                               maxsize: cuint; sizeP: ptr cuint): tupletable {.cdecl,
    importc: "pnm_computetuplefreqtable", dynlib: netpbm.}
proc pnm_computetuplefreqtable2*(pamP: ptr pam; tupleArray: ptr ptr `tuple`;
                                maxsize: cuint; newMaxval: sample; sizeP: ptr cuint): tupletable {.
    cdecl, importc: "pnm_computetuplefreqtable2", dynlib: netpbm.}
proc pnm_computetuplefreqtable3*(pamP: ptr pam; tupleArray: ptr ptr `tuple`;
                                maxsize: cuint; newDepth: cuint; newMaxval: sample;
                                countP: ptr cuint): tupletable {.cdecl,
    importc: "pnm_computetuplefreqtable3", dynlib: netpbm.}
proc pnm_computetuplefreqhash*(pamP: ptr pam; tupleArray: ptr ptr `tuple`;
                              maxsize: cuint; sizeP: ptr cuint): tuplehash {.cdecl,
    importc: "pnm_computetuplefreqhash", dynlib: netpbm.}
proc pnm_computetupletablehash*(pamP: ptr pam; tupletable: tupletable;
                               tupletableSize: cuint): tuplehash {.cdecl,
    importc: "pnm_computetupletablehash", dynlib: netpbm.}
proc pnm_tuplehashtotable*(pamP: ptr pam; tuplehash: tuplehash; maxsize: cuint): tupletable {.
    cdecl, importc: "pnm_tuplehashtotable", dynlib: netpbm.}
proc pam_colorname*(pamP: ptr pam; color: `tuple`; format: colornameFormat): cstring {.
    cdecl, importc: "pam_colorname", dynlib: netpbm.}