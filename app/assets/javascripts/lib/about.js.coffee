ready = ->
  $('.chief_link').click ->
    if $(this).hasClass('collapsed')
      $('#left-about').addClass('with_dark_background_85')
    else
      $('#left-about').removeClass('with_dark_background_85')

$(document).on 'page:load', ready
$(document).ready ready