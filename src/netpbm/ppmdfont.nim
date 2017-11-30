import pm_config
import pm
type
  ppmd_fontHeader* {.bycopy.} = object
    signature*: array[8, char]
    format*: cuchar
    characterCount*: cuchar
    firstCodePoint*: cuchar

  ppmd_glyphHeader* {.bycopy.} = object
    commandCount*: cuchar
    skipBefore*: cuchar
    skipAfter*: cuchar

  ppmd_glyphCommandVerb* {.size: sizeof(cint).} = enum
    CMD_NOOP = 0, CMD_DRAWLINE = 1, CMD_MOVEPEN = 2


type
  ppmd_glyphCommand* {.bycopy.} = object
    verb*: ppmd_glyphCommandVerb
    x*: cuchar
    y*: cuchar

  ppmd_glyph* {.bycopy.} = object
    header*: ppmd_glyphHeader
    commandList*: ptr ppmd_glyphCommand

  ppmd_font* {.bycopy.} = object
    header*: ppmd_fontHeader
    glyphTable*: ptr ppmd_glyph


proc ppmd_set_font*(newFontP: ptr ppmd_font) {.cdecl, importc: "ppmd_set_font",
    dynlib: netpbm.}
proc ppmd_get_font*(): ptr ppmd_font {.cdecl, importc: "ppmd_get_font", dynlib: netpbm.}
proc ppmd_read_font*(ifP: ptr FILE; fontPP: ptr ptr ppmd_font) {.cdecl,
    importc: "ppmd_read_font", dynlib: netpbm.}
proc ppmd_free_font*(fontP: ptr ppmd_font) {.cdecl, importc: "ppmd_free_font",
    dynlib: netpbm.}