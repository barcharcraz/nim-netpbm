import pm_config
type pixval = object
type pixel = object
type
  colorhist_vector* = ptr colorhist_item
  colorhist_item* {.bycopy.} = object
    color*: pixel
    value*: cint

  colorhist_list* = ptr colorhist_list_item
  colorhist_list_item* {.bycopy.} = object
    ch*: colorhist_item
    next*: colorhist_list


proc ppm_computecolorhist*(pixels: ptr ptr pixel; cols: cint; rows: cint;
                          maxcolors: cint; colorsP: ptr cint): colorhist_vector {.
    cdecl, importc: "ppm_computecolorhist", dynlib: netpbm.}
proc ppm_computecolorhist2*(ifp: ptr FILE; cols: cint; rows: cint; maxval: pixval;
                           format: cint; maxcolors: cint; colorsP: ptr cint): colorhist_vector {.
    cdecl, importc: "ppm_computecolorhist2", dynlib: netpbm.}
proc ppm_addtocolorhist*(chv: colorhist_vector; colorsP: ptr cint; maxcolors: cint;
                        colorP: ptr pixel; value: cint; position: cint) {.cdecl,
    importc: "ppm_addtocolorhist", dynlib: netpbm.}
proc ppm_freecolorhist*(chv: colorhist_vector) {.cdecl,
    importc: "ppm_freecolorhist", dynlib: netpbm.}
type
  colorhash_table* = ptr colorhist_list

proc ppm_computecolorhash*(pixels: ptr ptr pixel; cols: cint; rows: cint;
                          maxcolors: cint; colorsP: ptr cint): colorhash_table {.
    cdecl, importc: "ppm_computecolorhash", dynlib: netpbm.}
proc ppm_computecolorhash2*(ifp: ptr FILE; cols: cint; rows: cint; maxval: pixval;
                           format: cint; maxcolors: cint; colorsP: ptr cint): colorhash_table {.
    cdecl, importc: "ppm_computecolorhash2", dynlib: netpbm.}
proc ppm_lookupcolor*(cht: colorhash_table; colorP: ptr pixel): cint {.cdecl,
    importc: "ppm_lookupcolor", dynlib: netpbm.}
proc ppm_colorhashtocolorhist*(cht: colorhash_table; maxcolors: cint): colorhist_vector {.
    cdecl, importc: "ppm_colorhashtocolorhist", dynlib: netpbm.}
proc ppm_colorhisttocolorhash*(chv: colorhist_vector; colors: cint): colorhash_table {.
    cdecl, importc: "ppm_colorhisttocolorhash", dynlib: netpbm.}
proc ppm_addtocolorhash*(cht: colorhash_table; colorP: ptr pixel; value: cint): cint {.
    cdecl, importc: "ppm_addtocolorhash", dynlib: netpbm.}
proc ppm_delfromcolorhash*(cht: colorhash_table; colorP: ptr pixel) {.cdecl,
    importc: "ppm_delfromcolorhash", dynlib: netpbm.}
proc ppm_alloccolorhash*(): colorhash_table {.cdecl, importc: "ppm_alloccolorhash",
    dynlib: netpbm.}
proc ppm_freecolorhash*(cht: colorhash_table) {.cdecl, importc: "ppm_freecolorhash",
    dynlib: netpbm.}
proc ppm_colorrowtocolorhash*(colorrow: ptr pixel; ncolors: cint): colorhash_table {.
    cdecl, importc: "ppm_colorrowtocolorhash", dynlib: netpbm.}
proc ppm_computecolorrow*(pixels: ptr ptr pixel; cols: cint; rows: cint; maxcolors: cint;
                         ncolorsP: ptr cint): ptr pixel {.cdecl,
    importc: "ppm_computecolorrow", dynlib: netpbm.}
proc ppm_mapfiletocolorrow*(fileP: ptr FILE; maxcolors: cint; ncolorsP: ptr cint;
                           maxvalP: ptr pixval): ptr pixel {.cdecl,
    importc: "ppm_mapfiletocolorrow", dynlib: netpbm.}
proc ppm_colorrowtomapfile*(ofP: ptr FILE; colormap: ptr pixel; ncolors: cint;
                           maxval: pixval) {.cdecl,
    importc: "ppm_colorrowtomapfile", dynlib: netpbm.}
proc ppm_sortcolorrow*(colorrow: ptr pixel; ncolors: cint; cmpfunc: proc (a2: ptr pixel;
    a3: ptr pixel): cint {.cdecl.}) {.cdecl, importc: "ppm_sortcolorrow", dynlib: netpbm.}
proc ppm_addtocolorrow*(colorrow: ptr pixel; ncolorsP: ptr cint; maxcolors: cint;
                       pixelP: ptr pixel): cint {.cdecl,
    importc: "ppm_addtocolorrow", dynlib: netpbm.}
proc ppm_findclosestcolor*(colormap: ptr pixel; ncolors: cint; pP: ptr pixel): cint {.
    cdecl, importc: "ppm_findclosestcolor", dynlib: netpbm.}