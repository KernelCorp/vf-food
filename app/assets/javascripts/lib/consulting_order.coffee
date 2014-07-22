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

order_form = ->
  $('#consulting_button').click consulting_order
  return

$(document).ready order_form
$(document).on 'page:load', order_form