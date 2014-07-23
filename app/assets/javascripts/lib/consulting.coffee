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

consulting_order = (e)->
  e.preventDefault()
  order = $('#order_form')
  is_hidden = order.hasClass('hidden')

  # Hide other
  if is_hidden
    order.parent().addClass('form_dark_background')
    order.removeClass('hidden')
  else
    order.parent().removeClass('form_dark_background')
    order.addClass('hidden')

  return

consulting = ->
  consulting_gallery()
  $('#consulting_button').click consulting_order
  return

$(document).ready consulting
$(document).on 'page:load', consulting