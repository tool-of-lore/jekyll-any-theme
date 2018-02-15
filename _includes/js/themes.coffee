# Theme switcher
$('.widget-themes a').each ->
	$(@).on "click", (e) ->
		e.preventDefault()
		$('#main-css').attr 'href', "/assets/css/#{$(e.target).data('theme')}.css"
		$('.widget-themes a').removeClass 'active'
		$(e.target).addClass 'active'
		$('#theme-value').text($(e.target).data('theme'))
		true
	true
