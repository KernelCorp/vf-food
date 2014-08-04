get_hex_image_color = (path, callback)->
  canvas = document.createElement('canvas')
  cntx = canvas.getContext('2d')
  img = new Image()
  img.onload = ->
    canvas.width = img.width
    canvas.height = img.height
    cntx.drawImage(img, 0, 0)
    data = cntx.getImageData(10,10,11,11).data
    res = ''
    # exclude alpha channel
    res += data[i].toString(16) for i in [0...3]
    callback(res)
    return
  img.src = path
  return

gallery_background = []

set_background = (el, oldIndex, newIndex)->
  document.body.style.backgroundColor = '#' + gallery_background[newIndex]
  return

prepare_background_colors = (li_list)->
  li_list.each (i)->
    li = $(this)
    img = li.children()
    path = img.attr('src')
    get_hex_image_color path, (color)->
      gallery_background[i] = color
      li.css('background-color', '#'+color)
      if i == 0
        set_background(null, null, i)
      return
    return
  return

consulting_slider_ul = null

consulting_gallery = ->
  consulting_slider_ul = $('#consulting_slider ul')
  if !consulting_slider_ul
    return
  li_list = consulting_slider_ul.children('li')
  if li_list.length < 2
    $('#consulting_link').hide()
    if !li_list.length
      return

  prepare_background_colors(li_list)

  hide_slider_pager = ->
    consulting_slider_ul.parents('.bx-wrapper').find('.bx-default-pager').addClass('hidden')
    return

  consulting_slider = $(consulting_slider_ul).bxSlider
    mode: 'fade',
    controls: false,
    pager: true,
    startSlide: 0,
    auto: 3000,
    speed: 300,
    easing: 'ease',
    onSlideBefore: set_background,
    onSliderLoad: hide_slider_pager


  slider_destructor = ->
    consulting_slider.destroySlider()
    $(document).off 'page:fetch', slider_destructor
    return

  $(document).on 'page:fetch', slider_destructor

  document.body.style.transition = 'background-color 300ms ease 0'
  return

consulting_link_trigger = ->
  $('#consulting_link').click (e)->
    e.preventDefault()
    elem = $(this)
    order = $('#order_form')
    order_is_hidden = order.hasClass('hidden')
    background = $('.dark_container')

    # If next method collapse - do it
    if elem.hasClass('collapse')
      # Hide order form if showed
      if !order_is_hidden
        consulting_order_trigger(e)
      # Hide description
      $('#consulting_description').hide()
      # Hide background for description
      background.addClass('hidden')
      # show pager for slider
      consulting_slider_ul.parents('.bx-wrapper').find('.bx-default-pager').removeClass('hidden')
      elem.addClass('expand').removeClass('collapse')
    else
      # else next method expand
      $('#consulting_description').show()
      background.removeClass('hidden')
      # hide pager for slider
      consulting_slider_ul.parents('.bx-wrapper').find('.bx-default-pager').addClass('hidden')
      elem.addClass('collapse').removeClass('expand')
    return
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
  consulting_link_trigger()
  $('#consulting_button').click consulting_order_trigger
  return

$(document).ready consulting
$(document).on 'page:load', consulting