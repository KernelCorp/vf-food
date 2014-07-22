last_elem = null

order_form_trigger = (e)->
  e.preventDefault()
  order = $('#order_form')
  is_hidden = order.hasClass('hidden')

  # Hide other
  if is_hidden
    last_elem = order.parent().children('.elem_to_hide.visible')
    last_elem.removeClass('visible').addClass('hidden')

    order.removeClass('hidden')
    $('div.order_background').addClass('dark_background')
  else
    order.addClass('hidden')
    $('div.order_background').removeClass('dark_background')
    last_elem.removeClass('hidden').addClass('visible')

  return

order_form = ->
  $('#catering_button').click order_form_trigger
  return

$(document).ready order_form
$(document).on 'page:load', order_form