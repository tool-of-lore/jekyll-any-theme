#
# TABLE OF CONTENTS
#
# Markdown toc rendered by
# * toc
# {:toc}
#
# produce a <ul id="markdown.toc"></ul>

# Collapsible
# Move #markdown-toc inside #toc-collapseOne .card-body
if $('#toc-collapseOne .card-body').length and $('#markdown-toc').length
	$ '#markdown-toc'
		.prependTo "#toc-collapseOne .card-body"
