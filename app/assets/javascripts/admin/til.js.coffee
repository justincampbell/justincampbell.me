//= require jquery

timer = null
slugTouched = false

cleanSlug = ->
  buffer = $('#til_slug').attr 'value'
  buffer = buffer.toLowerCase()
  buffer = buffer.replace /[^\w]+/g, '-' # replace special characters with dashes
  buffer = buffer.replace /^-|-$/g, '' # remove dashes from beginning and end
  $('#til_slug').attr 'value', buffer

preview = ->
  $.post '/til/preview', $('form').serialize(), (result) ->
    $('.preview').html result

textAreaUpdated = ->
  preview()
  updateSlug() unless slugTouched
  cleanSlug()

updateSlug = ->
  $('#til_slug').attr 'value', $('#til_body').attr('value').split("\n")[0]

$ ->
  $('#til_body').keyup ->
    clearTimeout timer
    timer = setTimeout textAreaUpdated, 500

  $('#til_slug').change ->
    slugTouched = true
    cleanSlug()
