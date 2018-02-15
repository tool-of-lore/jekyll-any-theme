login = {
  link: $ 'a[href$="Login"]'
  form: $ '#loginModal'
  field: $ '#personalToken'
  submit: $ '#submitLogin'
  feedback: $('#loginModal').find '.invalid-feedback'
  warn: (message) ->
    login.field.addClass('is-invalid').focus()
    login.feedback.text message
    return
  reset: () ->
    login.field.removeClass 'is-invalid'
    login.field.val ''
    login.submit.prop 'disabled', false
    return
  init: () ->
    console.log login.link
    login.link
      .attr 'data-placement', "left"
      .on "click", login.modal_event
    login.submit.on "click", login.submit_event
    if storage.get('token') and login.link.text() == "Login"
      login.link
        .text 'Logout'
        .attr 'href', 'Logout'
        .attr 'title', "Logged as #{storage.get('user')}"
        .attr 'data-toggle', 'tooltip'
        .off "click", login.modal_event
        .on "click", login.logout_event
    true
  request: () ->
    login.field.removeClass 'is-invalid'
    login.submit.prop 'disabled', true
    $.ajax 'https://api.github.com/user',
      type: 'GET'
      headers: {"Authorization": "token #{login.field.val()}"}
      success: login.success
      error: login.error
    true
  success: (data, status) ->
    login.form.modal 'hide'
    login.log = true
    storage
      .set 'token', login.field.val()
      .set 'user', data.login
      .set 'logged', new Date().getTime()
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
  logout_event: (e) ->
    e.preventDefault()
    login.log = false
    storage.clear()
    $ e.target
      .text 'Login'
      .attr 'href', 'Login'
      .attr 'data-original-title', "Logged Out"
      .tooltip 'show'
      .off "click", login.logout_event
      .on "click", login.modal_event
    setTimeout ->
      $ e.target
        .tooltip 'dispose'
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
}

login.init()
