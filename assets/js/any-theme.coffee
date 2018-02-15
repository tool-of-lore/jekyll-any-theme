---
---

{% include js/storage.coffee %}
{% include js/login.coffee %}
{% include js/themes.coffee %}
{% include js/libros.coffee %}

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

# Initiate clipboard.js
new Clipboard '.btn'
