if window.history?.pushState and window.history.replaceState
  document.addEventListener 'page:change', (event) =>
    if window.ga != undefined
      ga('set', 'location', location.href.split('#')[0])
      ga('send', 'pageview')

    if window._gaq != undefined
      _gaq.push(['_trackPageview'])
