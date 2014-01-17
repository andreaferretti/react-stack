requirejs.config
  baseUrl: './js'

  paths:
    'react':        '../components/react/react-with-addons'
    'q':            '../components/q/q'
    'pajamas':      '../components/pajamas/dist/pajamas'
    'signals':      '../components/js-signals/dist/signals'
    'crossroads':   '../components/crossroads.js/dist/crossroads'
    'hasher':       '../components/hasher/dist/js/hasher'
    'prelude-ls':   '../components/prelude-ls/browser/prelude-browser'
    '_l':           'app/prelude/_l'
    '_f':           'app/prelude/_f'
    '_o':           'app/prelude/_o'
    '_s':           'app/prelude/_s'
    '_n':           'app/prelude/_n'

require ['prelude-ls', './router'], () ->
  console.log 'started'
