storage = {
  init: () ->
    if !localStorage.getItem("any-theme")? then storage.store { "created": new Date().getTime() }
    true
  clear: (key) ->
    obj = storage.get()
    if key?
      delete obj[key]
      storage.store obj
      true
    else
      localStorage.clear 'any-theme'
      true
  set: (key, value) ->
    obj = storage.get()
    if key? and value?
      obj[key] = value
      storage.store obj
      true
    else
      false
  get: (key) ->
    if key?
      storage.get()[key]
    else
      JSON.parse LZString.decompressFromBase64 localStorage.getItem "any-theme"
  store: (obj) ->
    localStorage.setItem 'any-theme', LZString.compressToBase64 JSON.stringify obj
}

storage.init()
