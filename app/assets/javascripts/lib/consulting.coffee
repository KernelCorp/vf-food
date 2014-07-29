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

consulting_gallery = ->
  slider = $('#consulting_slider ul')
  li_list = slider.children('li')
  if !li_list.length
    $('#consulting_link').hide()
    return

  prepare_background_colors(li_list)

  $(slider).bxSlider({
    mode: 'fade',
    controls: false,
    pager: true,
    auto: 3000,
    speed: 2000,
    easing: 'ease',
    onSlideBefore: set_background
  })

  document.body.style.transition = 'background-color 2s ease 0'

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