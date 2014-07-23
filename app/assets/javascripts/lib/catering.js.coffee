catering_gallery = ->
  $('#caterigns ul.bxslider').bxSlider({
    mode: 'fade',
    controls: false,
    pager: false,
    auto: 3000
  })

order_form_trigger = (e)->
  e.preventDefault()
  order = $('#order_form')
  is_hidden = order.hasClass('hidden')
  last_elem = order.parent().children('.catering-slider')

  if is_hidden
    last_elem.addClass('hidden')
    order.removeClass('hidden')
    $('div.order_background').addClass('dark_background')
  else
    order.addClass('hidden')
    last_elem.removeClass('hidden')
    $('div.order_background').removeClass('dark_background')
  return

catering = ->
  catering_gallery()
  $('#catering_button').click order_form_trigger
  return

$(document).ready catering
$(document).on 'page:load', catering