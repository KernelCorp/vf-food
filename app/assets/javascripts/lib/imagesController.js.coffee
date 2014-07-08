class window.imagesController
  delete_image: (e) ->
    e.preventDefault()
    elem = $(this)
    parent = elem.parents('.image_elem')
    img_id = parent.find('.image-id')[0].value
    project_id = parent.find('.project-id')[0].value
    url = elem.attr('href')
    $.ajax(
      type: 'delete'
      url: url
      data: {
        project_id: project_id
        image_id: img_id
      }
      success: (res)->
        if res.success
          parent.remove()
        return
    )
    return

  init_images: () ->
    $('#image_grid').on 'click', 'a.delete-image', @delete_image
    return