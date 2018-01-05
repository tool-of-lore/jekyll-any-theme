login = {
  init: () ->
    # Attach toggle modal event to links with `href="Login"`
    # Toggle modal login `_includes/page/login.html`
    for login_open in $ 'a[href="Login"]'
      $(login_open).on "click", (e) -> 
        e.preventDefault()
        $ '#loginModal'
          .modal 'toggle'
        for token_field in $ '#personal_token'
          token_field.focus()
        true
    # Process login submit
    # Search for `#submitLogin` button
    for login_submit in $ '#submitLogin'
      $(login_submit).on "click", (e) ->
        e.preventDefault()
        # Search for '#personal_token' input field
        token = $('#personal_token').val()
        if token.length == 40
          $(e.target).prop 'disabled', true
          $.ajax 'https://api.github.com/user',
            type: 'GET'
            headers: {"Authorization": "token #{token}"}
            success: (data, status) ->
              # data.login = 'petrosh'
              # status = 'success'
              $ '#loginModal'
                .modal 'toggle'
              $ 'a[href="Login"]'
                .text 'Logout'
              # dismiss modal, Login link to Logout and tooltip
              true
            error: (request, status, error) ->
              # status = 'error'
              # error = 'Unauthorized'
              $('#personal_token').val('')
              $(e.target).prop 'disabled', false
              # out message, clear field, enable button
              true
          # storage.set('token', $('#personal_token').val())
        true
    true
}

login.init()
