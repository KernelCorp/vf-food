catering_gallery = ->
  $('#caterigns ul.bxslider').bxSlider({
    mode: 'fade',
    controls: false,
    pager: false,
    auto: 3000
  })

$(document).ready catering_gallery
$(document).on 'page:load', catering_gallery