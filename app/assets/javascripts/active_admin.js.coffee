#= require active_admin/base
#= require activeadmin-sortable
#= require lib/imagesController
#= require vendor/fileuploader.js
#= require tinymce
#= require admin_lib/init_tinymce

$(document).ready ->
  images = new(imagesController)
  images.init_images()

  $('#edit_catering a.has_many_add').click ->
    setTimeout init, 0
  $('#new_catering a.has_many_add').click ->
    setTimeout init, 0

  return
