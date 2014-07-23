order_form_trigger = (e)->
  e.preventDefault()
  order = $('#order_form')
  is_hidden = order.hasClass('hidden')

  last_elem = order.parent().children('.elem_to_hide')

  if is_hidden
    last_elem.addClass('hidden')
    order.removeClass('hidden')
    $('div.order_background').addClass('dark_background')
  else
    order.addClass('hidden')
    last_elem.removeClass('hidden')
    $('div.order_background').removeClass('dark_background')

  return

master_class = ->
  $('#master_class_button').click order_form_trigger
  return

$(document).ready master_class
$(document).on 'page:load', master_class