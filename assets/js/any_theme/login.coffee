login = {
  log: false
  link: $ 'a[href="Login"]'
  form: $ '#loginModal'
  field: $ '#personalToken'
  submit: $ '#submitLogin'
  feedback: $('#loginModal').find('.invalid-feedback')
  check: $ 'a[href="Check"]'
  logged: () -> login.log
  warn: (message) ->
    login.field.addClass('is-invalid').focus()
    login.feedback.text(message)
    return
  reset: () ->
    login.field.removeClass 'is-invalid'
    login.field.val('')
    login.submit.prop 'disabled', false
    return
  init: () ->
    login.check.on "click", login.check_logged
    login.link.on "click", login.modal_event
    login.submit.on "click", login.submit_event
    true
  request: () ->
    login.field.removeClass 'is-invalid'
    login.submit.prop 'disabled', true
    $.ajax 'https://api.github.com/user',
      type: 'GET'
      headers: {"Authorization": "token #{login.field.val()}"}
      success: (data, status) ->
        login.log = true
        login.form.modal 'hide'
        login.link
          .text 'Logout'
          .attr 'href', 'Logout'
          .attr 'title', "Logged as #{data.login}"
          .attr 'data-toggle', 'tooltip'
          .tooltip 'show'
          .off "click", login.modal_event
          .on "click", login.logout_event
        setTimeout ->
          login.link.tooltip 'hide'
        , 3000
        true
      error: (request, status, error) ->
        login.warn "#{status}: #{error}"
        login.submit.prop 'disabled', false
        true
    # storage.set('token', $('#personal_token').val())
    true
  logout_event: (e) ->
    e.preventDefault()
    login.log = false
    # storage.clear()
    $ e.target
      .text 'Login'
      .attr 'href', 'Login'
      .attr 'data-original-title', "Logged Out"
      .attr 'data-toggle', 'tooltip'
      .tooltip 'show'
      .off "click", login.logout_event
      .on "click", login.modal_event
    setTimeout ->
      $(e.target).tooltip 'hide'
    , 3000
    true
  modal_event: (e) -> 
    e.preventDefault()
    login.reset()
    login.form.modal 'show'
    login.field.focus()
    true
  submit_event: (e) ->
    e.preventDefault()
    if login.field.val().length == 40 then login.request() else login.warn 'Invalid token'
    true
  check_logged: (e) ->
    e.preventDefault()
    console.log login.logged()
}

login.init()
