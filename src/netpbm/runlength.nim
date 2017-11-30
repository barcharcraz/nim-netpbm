import pm_config

type
  pm_RleMode* {.size: sizeof(cint).} = enum
    PM_RLE_PACKBITS, PM_RLE_GRAPHON, PM_RLE_PPA, PM_RLE_SGI8, PM_RLE_SGI16,
    PM_RLE_PALM16, PM_RLE_PALMPDB


proc pm_rlenc_maxbytes*(inSize: csize; mode: pm_RleMode): csize {.cdecl,
    importc: "pm_rlenc_maxbytes", dynlib: netpbm.}
proc pm_rlenc_allocoutbuf*(outbufP: ptr ptr cuchar; inSize: csize; mode: pm_RleMode) {.
    cdecl, importc: "pm_rlenc_allocoutbuf", dynlib: netpbm.}
proc pm_rlenc_freebuf*(buf: pointer) {.cdecl, importc: "pm_rlenc_freebuf",
                                    dynlib: netpbm.}
proc pm_rlenc_compressbyte*(inbuf: ptr cuchar; outbuf: ptr cuchar; mode: pm_RleMode;
                           inSize: csize; outputSizeP: ptr csize) {.cdecl,
    importc: "pm_rlenc_compressbyte", dynlib: netpbm.}
proc pm_rlenc_compressword*(inbuf: ptr uint16; outbuf: ptr cuchar; mode: pm_RleMode;
                           itemCnt: csize; outputSizeP: ptr csize) {.cdecl,
    importc: "pm_rlenc_compressword", dynlib: netpbm.}