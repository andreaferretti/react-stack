requirejs.config
  baseUrl: './js'

  paths:
    'react':        '../components/react/react-with-addons'
    'q':            '../components/q/q'
    'pajamas':      '../components/pajamas/dist/pajamas'
    'signals':      '../components/js-signals/dist/signals'
    'crossroads':   '../components/crossroads.js/dist/crossroads'
    'hasher':       '../components/hasher/dist/js/hasher'
    #'moment':       '../components/momentjs/moment'
    #'paths':        '../components/paths-js/dist/amd'
    #'io':           '../components/socket.io-client/dist/socket.io'
    'prelude-ls':   '../components/prelude-ls/browser/prelude-browser'
    '_l':           'prelude/_l'
    '_f':           'prelude/_f'
    '_o':           'prelude/_o'
    '_s':           'prelude/_s'
    '_n':           'prelude/_n'

require ['prelude-ls', './router'], () ->
  console.log 'started'
