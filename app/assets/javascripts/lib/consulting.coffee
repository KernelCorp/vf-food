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
    order = $('#order_form')
    is_hidden = order.hasClass('hidden')
    background = $('.dark_container .right_block')
    if elem.hasClass('collapse')
      if !is_hidden
        consulting_order(e)
      $('#consulting_description').hide()
      background.addClass('hidden')
      elem.addClass('expand').removeClass('collapse').text('<')
    else
      $('#consulting_description').show()
      background.removeClass('hidden')
      elem.addClass('collapse').removeClass('expand').text('>')

  return

consulting_order = (e)->
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
  $('#consulting_button').click consulting_order
  return

$(document).ready consulting
$(document).on 'page:load', consulting