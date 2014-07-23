#= require active_admin/base
#= require lib/imagesController
#= require vendor/fileuploader.js

$(document).ready ->
  images = new(imagesController)
  images.init_images()
