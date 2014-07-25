# Expand main wrapper block if content do not fit in page
layout = ->
  el = document.getElementById 'main_wrapper'
  if el.scrollHeight > el.clientHeight
    el.style.height = 'auto'
  return

#$(document).ready layout
#$(document).on 'page:load', layout