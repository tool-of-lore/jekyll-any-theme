store = (key, value) ->
  if value
    found = JSON.parse LZString.decompressFromBase64 localStorage.getItem key
    compressed = LZString.compressToBase64 JSON.stringify value
    return localStorage.setItem key, compressed
  else
    return LZString.decompressFromBase64 localStorage.getItem key
