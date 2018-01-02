for login_open in $ 'a[href="Login"]'
  $(login_open).on "click", (e) -> 
    e.preventDefault()
    $ '#loginModal'
      .modal 'toggle'
    return

for login_submit in $ '#submitLogin'
  $(login_submit).on "click", (e) ->
    e.preventDefault()
    if $('#personal_token').val().length
      console.log 'ok'
    return
