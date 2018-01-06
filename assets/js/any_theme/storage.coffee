storage = {
  init: () ->
    if !localStorage.getItem("any-theme")? then storage.store { "created": new Date().getTime() }
    $('a[href="Show"]').on "click", (e) ->
      e.preventDefault()
      console.log storage.get()
      true
    true
  clear: (key) ->
    obj = storage.get()
    if key?
      delete obj[key]
      storage.store obj
      true
    else
      localStorage.removeItem 'any-theme'
      true
  set: (key, value) ->
    if !localStorage.getItem("any-theme")? then storage.init()
    obj = storage.get()
    if key? and value?
      obj[key] = value
      storage.store obj
      return storage
    else
      false
  get: (key) ->
    if !localStorage.getItem("any-theme")? then storage.init()
    if key?
      storage.get()[key]
    else
      JSON.parse LZString.decompressFromBase64 localStorage.getItem "any-theme"
  store: (obj) ->
    localStorage.setItem 'any-theme', LZString.compressToBase64 JSON.stringify obj
}

storage.init()
