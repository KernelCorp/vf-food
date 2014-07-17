pos = 0

consulting_gallery = ->
  if typeof consultingImageList == 'undefined' or !consultingImageList.length
    $('#consulting_link').hide()
    return

  pos = 0
  $('#consulting_link').click (e)->
    e.preventDefault()
    $(document.body).css({'background': '#f9f9f9 url('+ consultingImageList[pos]+') center bottom no-repeat'})
    if ++pos >= consultingImageList.length
      pos = 0
    return
  return

$(document).ready consulting_gallery
$(document).on 'page:load', consulting_gallery