

when defined(linux):
  const netpbm* = "libnetpbm.so"
elif defined(windows):
  const netpbm* = "netpbm.dll"

type pm_filepos* = clong