libros =
  widget: $ '#widget-libros'
  submit_button: $ '#widget-libros [type="submit"]'
  input_title: $ '#widget-libros [placeholder="Title"]'
  input_author: $ '#widget-libros [placeholder="Author(s)"]'
  input_fields: $ '#widget-libros [placeholder="Title"], [placeholder="Author(s)"]'
  results: $ '#libros-results'
  reset_button: $ '#widget-libros [type="reset"]'
  init: () ->
    # Submit events
    libros.submit_button.on 'click', libros.submit_event
    libros.input_fields.keypress (e) -> if e.which == 13 then libros.submit_event e
    # Book click event
    libros.results.on "click", "a", libros.book_event
    true
  submit_event: (e) ->
    e.preventDefault()
    search_string = $.grep([
        libros.input_title.val().trim().replace /\s/g, "+"
        libros.input_author.val().trim().replace /\s/g, "+"
      ], Boolean).join '+'
    if search_string
      libros.loading(1)
      $.getJSON "http://openlibrary.org/search.json?q=#{search_string}", (data) ->
        libros.loading(0)
        if data.docs.length == 0
          libros.results.append $ "<a href='#' class='no-results'>No results</li>"
        else
          $.each data.docs, (i, item) ->
            book = {
              olid: item.cover_edition_key || null
              authors: item.author_name || []
              year: item.first_publish_year ? if item.publish_year? then item.publish_year[0] else item.publish_date ? ''
              image: item.cover_edition_key || null
              publisher: if item.publisher? then item.publisher[0] ? ''
              title: item.title
            }
            if book.olid
              entry = $("<a>", {'href': '#'})
              entry.data 'book', book
              row =  $ '<div>', {'class': 'row'}
              if book.image
                image_column = $ '<div>', {'class': 'col-2 pr-0'}
                image_column.append $ '<img>', {
                  'src': "http://covers.openlibrary.org/b/olid/#{book.image}-M.jpg",
                  'class': 'card-img-top'
                }
                row.append image_column
              content_column = $ '<div>', {'class': 'col'}
              header = $ '<div>', {
                html: $ '<h5>', { 'text': book.title }
              }
              header.append $ '<small>', { 'text': book.year }
              content_column.append header
              content_column.append $ '<p>', { 'text': book.authors.join ', ' }
                .append $ '<small>', { 'text': book.publisher }
              row.append content_column
              entry.append row
              libros.results.append entry
            true
        true
    true
  loading: (b) ->
    libros.results.html ''
    if b
      libros.submit_button.prop {disabled: true}
      libros.reset_button.prop {disabled: true}
      libros.input_fields.blur()
      libros.submit_button.data 'cache', libros.submit_button.text()
      libros.submit_button.text 'Loading'
    else
      libros.submit_button.prop {disabled: false}
      libros.reset_button.prop {disabled: false}
      libros.submit_button.text libros.submit_button.data 'cache'
    true
  book_event: (e) ->
    e.preventDefault()
    data = $(e.currentTarget).data 'book'
    console.log e,data
    true

libros.init()

# 
# $ '#libros-results'
# 	.on "click", "a", (e) ->
# 		e.preventDefault()
# 		loading 1
# 		ol_key = this.href.match(/([^\/]*)\/*$/)[1]
# 		$.getJSON "http://openlibrary.org/api/books?bibkeys=#{ol_key}&format=json&jscmd=data", (data) ->
# 			loading 0
# 			book = data[ol_key]
# 			$(".widget-libros [placeholder='Author(s)']").val book.authors.map (a) -> return a.name
# 				.addClass "is-valid"
# 			$ ".widget-libros [placeholder='Title']"
# 				.val book.title
# 					.addClass "is-valid"
# 			# $("#input-publishers").val book.publishers.map (p) -> return p.name
# 			# 	.addClass "is-valid"
# 			# $("#input-publish_year").val book.publish_date
# 			# 	.addClass "is-valid"
# 			# $("#input-edition_key").val book.identifiers.openlibrary[0]
# 			# 	.addClass "is-valid"
# 			# $("#input-isbn").val book.identifiers.isbn_10[0]
# 			# 	.addClass "is-valid"
# 			# $("#input-cover").val book.cover.medium || ''
# 			# 	.addClass "is-valid"
# 			return
# 		return
# 
# $ () ->
# 	# Initialize datepicker
# 	# $('[data-toggle="datepicker"]').datepicker {
# 	# 	autoHide: true
# 	# 	zIndex: 2048
# 	# 	format: 'yyyy-mm-dd'
# 	# }
# 	# Enable currecy button
# 	# if $('#button-currency').length and $('a[data-currency]').length
# 	# 	$ 'a[data-currency]'
# 	# 		.on "click", (e) ->
# 	# 			new_currency = $(e.target).attr "data-currency"
# 	# 			$('#button-currency').text $('#button-currency').text().slice(0, -1) + new_currency
