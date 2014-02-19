module.exports = (grunt) ->
  require('load-grunt-config') grunt,
    config:
      app: 'app'
      src: 'src/coffee'
      sass: 'src/sass'
      dist: 'dist'

      tmp: '.tmp'
      tmp_dist: '.tmp-dist'
    init: true