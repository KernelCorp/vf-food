last_elem = null

catering_gallery = ->
  $('#caterigns ul.bxslider').bxSlider({
    mode: 'fade',
    controls: false,
    pager: false,
    auto: 3000
  })

order_form_trigger = (e)->
  e.preventDefault()
  goal_elem = $(e.data.goal)
  is_hidden = goal_elem.hasClass('hidden')
  default_elem = $('.catering-slider')

  if is_hidden
    default_elem.addClass('hidden')
    if last_elem
      last_elem.addClass('hidden')
    goal_elem.removeClass('hidden')
    $('div.order_background').addClass('dark_background')
  else
    goal_elem.addClass('hidden')
    default_elem.removeClass('hidden')
    $('div.order_background').removeClass('dark_background')
  last_elem = goal_elem
  return

catering = ->
  catering_gallery()
  $('#catering_order_button').click goal: '#order_form', order_form_trigger
  $('#catering_menu_button').click goal: '.menu_block', order_form_trigger
  $('.menu_block a.close_button').click goal: '.menu_block', order_form_trigger
  return

$(document).ready catering
$(document).on 'page:load', catering