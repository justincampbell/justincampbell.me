//= require jquery

timer = null

preview = ->
  $.post '/til/preview', $('form').serialize(), (result) ->
    $('.preview').html result

$ ->
  $('#til_body').keyup ->
    clearTimeout timer
    timer = setTimeout preview, 500
