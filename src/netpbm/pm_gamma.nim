import math
proc pm_gamma709*(intensity: cfloat): cfloat {.inline, cdecl.} =
  var gamma: cfloat
  var oneOverGamma: cfloat
  var linearCutoff: cfloat
  var linearExpansion: cfloat
  var brightness: cfloat
  if intensity < linearCutoff: brightness = intensity * linearExpansion
  else: brightness = 1.099 * pow(intensity, oneOverGamma) - 0.099
  return brightness

proc pm_ungamma709*(brightness: cfloat): cfloat {.inline, cdecl.} =
  var gamma: cfloat
  var oneOverGamma: cfloat
  var linearCutoff: cfloat
  var linearExpansion: cfloat
  var intensity: cfloat
  if brightness < linearCutoff * linearExpansion:
    intensity = brightness / linearExpansion
  else:
    intensity = pow((brightness + 0.099) / 1.099, gamma)
  return intensity
