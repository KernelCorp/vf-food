
consulting_gallery = ->
  slider = $('#consulting_slider ul')
  if !slider.children('li').length
    $('#consulting_link').hide()
    return

  $(slider).bxSlider({
    mode: 'fade',
    controls: false,
    pager: false,
    auto: 3000
  })

  $('#consulting_link').click (e)->
    e.preventDefault()
    elem = $(this)
    if elem.hasClass('collapse')
      $('#consulting_description').hide()
      elem.addClass('expand').removeClass('collapse').text('<')
    else
      $('#consulting_description').show()
      elem.addClass('collapse').removeClass('expand').text('>')

  return

$(document).ready consulting_gallery
$(document).on 'page:load', consulting_gallery