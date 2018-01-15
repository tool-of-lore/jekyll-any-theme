---
---

{% include_relative any_theme/storage.coffee %}
{% include_relative any_theme/login.coffee %}

# Collapsible
# Move #markdown-toc inside #toc-collapseOne .card-body
# Refer to _includes/components/toc.html
if $('#toc-collapseOne > div').length and $('#markdown-toc').length
	$ '#markdown-toc'
		.prependTo "#toc-collapseOne"

# Enable tooltips
$ '[data-toggle*=tooltip]'
	.tooltip()

# Show page_info modal
$ 'a[href="Page info"]'
	.on "click", (e) ->
		e.preventDefault()
		$ '#pageinfoModal'
			.modal 'show'

# Active navbar link on dropdowns
$('li.dropdown').each ->
	if $(@).find('div.dropdown-menu a.active').length then $(@).find('> a').addClass 'active'
	true

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
