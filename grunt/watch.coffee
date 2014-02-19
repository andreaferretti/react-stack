config =
  livereload_port: 35729

module.exports =
  options:
    interrupt: true

  coffee:
    files: ['<%= src %>/{,**/}*.coffee']
    tasks: ['coffee:compile', 'react:compile']

  compass:
    files: ['<%= sass %>/{,**/}*.{scss,sass}']
    tasks: ['compass:compile']

  files:
    files: [
      '<%= tmp %>/{,**/}*.{css,js}'
      '<%= app %>/{,**/}*.html'
      '<%= app %>/css/{,**/}*.css'
      '<%= app %>/js/{,**/}*.js'
      '<%= app %>/images/{,**/}*.{png,jpg,jpeg}'
      '!<%= app %>/components/**'
    ]
    tasks: []
    options:
      livereload: config.livereload_port