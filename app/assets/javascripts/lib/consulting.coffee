consulting_gallery = ->
  slider = $('#consulting_slider ul')
  if !slider.children('li').length
    $('#consulting_link').hide()
    return

  $(slider).bxSlider({
    mode: 'fade',
    controls: false,
    pager: true,
    auto: 3000
  })

  $('#consulting_link').click (e)->
    e.preventDefault()
    elem = $(this)
    order = $('#order_form')
    is_hidden = order.hasClass('hidden')
    background = $('.dark_container')
    if elem.hasClass('collapse')
      if !is_hidden
        consulting_order_trigger(e)
      $('#consulting_description').hide()
      background.addClass('hidden')
      elem.addClass('expand').removeClass('collapse')
    else
      $('#consulting_description').show()
      background.removeClass('hidden')
      elem.addClass('collapse').removeClass('expand')

  return

consulting_order_trigger = (e)->
  e.preventDefault()
  order = $('#order_form')
  background = $('.dark_container .left_block')
  is_hidden = order.hasClass('hidden')

  # Hide other
  if is_hidden
    background.removeClass('hidden')
    order.removeClass('hidden')
  else
    background.addClass('hidden')
    order.addClass('hidden')

  return

consulting = ->
  consulting_gallery()
  $('#consulting_button').click consulting_order_trigger
  return

$(document).ready consulting
$(document).on 'page:load', consulting