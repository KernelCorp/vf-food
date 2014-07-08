#= require active_admin/base
#= require lib/imagesController
#= require fileuploader.js

$(document).ready ->
  images = new(imagesController)
  images.init_images()
