if window.history?.pushState and window.history.replaceState
  document.addEventListener 'page:change', (event) =>
    if window.yaCounter25797572 != undefined
      window.yaCounter25797572.hit location.href
