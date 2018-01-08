---
---

{% include_relative any_theme/storage.coffee %}
{% include_relative any_theme/login.coffee %}

# Collapsible
# Move #markdown-toc inside #toc-collapseOne .card-body
# Refer to _includes/components/toc.html
if $('#toc-collapseOne .card-body').length and $('#markdown-toc').length
	$ '#markdown-toc'
		.prependTo "#toc-collapseOne .card-body"

# Enable tooltips
$ '[data-toggle*=tooltip]'
	.tooltip()

# Page info modal
$ 'a[href="Page info"]'
	.on "click", (e) ->
		e.preventDefault()
		$ '#pageinfoModal'
			.modal 'show'
