module.exports =
  compile:
    files: [{
      expand: true
      cwd: '<%= tmp %>'
      src: ['**/*.jsx']
      dest: '<%= tmp %>'
      ext: '.js'
    }]