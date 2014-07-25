#= require active_admin/base
#= require lib/imagesController
#= require vendor/fileuploader.js
#= require tinymce
#= require admin_lib/init_tinymce

$(document).ready ->
  images = new(imagesController)
  images.init_images()
