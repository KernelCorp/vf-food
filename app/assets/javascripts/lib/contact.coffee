map = null

double_gis_loader= ->
  elem = $('<div></div>').css
    'width': '100%'
    'height': '100%'
  $('#double-gis-map').append(elem)
  map = DG.map elem[0],
    "center": [55.029034, 82.937738]
    "zoom": 17

  DG.marker([55.029077, 82.933833]).addTo(map)
  return

contacts = ->
  if map
    map.remove()
  if $('#double-gis-map').length
    if DG.isReady
      double_gis_loader()
    else
      DG.then double_gis_loader
  return

$(document).ready contacts
$(document).on 'page:load', contacts