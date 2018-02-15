libros =
  widget: $ '#widget-libros'
  input_title: $ '#libros-title'
  input_author: $ '#libros-author'
  input_search_fields: $ '#libros-title, #libros-author'
  fieldset: $ '#widget-libros fieldset'
  submit_button: $ '#widget-libros [type="submit"]'
  reset_button: $ '#widget-libros [type="reset"]'
  buttons: $ '#widget-libros [type="submit"], #widget-libros [type="reset"]'
  results: $ '#libros-results'
  template: $('#template-book').html()
  no_results: $ "<a href='#' class='no-results'>No results</li>"
  init: () ->
    # Init datepicker
    $('[data-toggle="datepicker"]').datepicker {
      autoHide: true
      zIndex: 2048
      format: 'yyyy-mm-dd'
    }
    # Reset event
    libros.reset_button.on 'click', () -> libros.results.html ''
    # Submit event
    libros.submit_button.on 'click', libros.submit_event
    libros.input_search_fields.keypress (e) -> if e.which == 13 then libros.submit_event e
    # Change event
    $('#widget-libros :input').change () -> libros.update_yml()
    # Book click event
    libros.results.on "click", "a", libros.book_event
    true
  submit_event: (e) ->
    e.preventDefault()
    search_string = $.grep([
        libros.input_title.val().trim().replace /[\s,]/g, "+"
        libros.input_author.val().trim().replace /[\s,]/g, "+"
      ], Boolean).join '+'
    if search_string then libros.search search_string
    true
  loading: (state) ->
    if state
      libros.results.html ''
      libros.fieldset.prop {disabled: true}
      libros.submit_button.data 'cache', libros.submit_button.text()
      libros.submit_button.text 'Loading'
    else
      libros.fieldset.prop {disabled: false}
      libros.submit_button.text libros.submit_button.data 'cache'
    true
  book_event: (e) ->
    e.preventDefault()
    libros.results.html ''
    data = JSON.parse LZString.decompressFromBase64 $(e.currentTarget).data 'book'
    ['title', 'year', 'author', 'publisher', 'image_url'].map (field) ->
      $("#libros-#{field}").val data[field]
      true
      libros.update_yml()
    true
  search: (string) ->
    libros.loading(1)
    $.getJSON "http://openlibrary.org/search.json?q=#{string}"
      .done (data) ->
        libros.loading(0)
        if data.docs.length == 0
          libros.results.append libros.no_results
        else
          $.each data.docs, libros.append_book
          if libros.results.is(':empty') then libros.results.append libros.no_results
        true
      .fail (xhr, status, err) ->
        libros.results.append $ "<a href='#' class='no-results'>#{status} #{err}</li>"
        true
    true
  append_book: (i, item) ->
    # Parse book properties
    book = {
      title: item.title
      author: if item.author_name? then item.author_name.join ', ' else null
      image_url: if item.cover_edition_key?
          "http://covers.openlibrary.org/b/olid/#{item.cover_edition_key}-M.jpg"
        else null
      year: item.first_publish_year ?
        if item.publish_year? then item.publish_year[0] else item.publish_date ? null
      publisher: if item.publisher? then item.publisher[0] else ''
      olid: item.cover_edition_key ? item.edition_key ? null
    }
    # Append data to template
    if book.olid?
      result = $ '<a>', {
          'href': book.olid
          'data-book': LZString.compressToBase64 JSON.stringify book
          'html': $ libros.template
        }
      ['title', 'year', 'author', 'publisher'].map (field) ->
        result.find(".libros-#{field}").text book[field]
      if book.image_url
        result.find('.libros-image-container')
          .addClass 'col-2'
          .append $ '<img>', {
            src: book.image_url
            alt: book.title
          }
      # Append book to results
      libros.results.append result
    true
  update_yml: () ->
    obj = {}
    for input in libros.widget.find '.form-control'
      key = $(input).attr('id').replace "libros-", ''
      if $(input).val() then obj[key] = $(input).val()
    # Update view
    libros.widget.find "#libros-yml"
      .html YAML.stringify [ obj ]

libros.init()
