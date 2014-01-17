mountFolder = (connect, dir)->
  return connect.static(require('path').resolve(dir))

module.exports = (grunt) ->

  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-compass')
  grunt.loadNpmTasks('grunt-contrib-connect')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-requirejs')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-react')
  grunt.loadNpmTasks('grunt-open')

  config =
    app: 'app'
    src: 'src/coffee'
    sass: 'src/sass'
    dist: 'dist'

    tmp: '.tmp'
    tmp_dist: '.tmp-dist'

    server_port: 9000
    livereload_port: 35729

  grunt.initConfig
    config: config
      
    watch:
      options:
        interrupt: true

      coffee:
        files: ['<%= config.src %>/{,**/}*.coffee']
        tasks: ['coffee:compile', 'react:compile']
        
      compass:
        files: ['<%= config.sass %>/{,**/}*.{scss,sass}']
        tasks: ['compass:compile']
      
      files:
        files: [
          '<%= config.tmp %>/{,**/}*.{css,js}'
          '<%= config.app %>/{,**/}*.html'
          '<%= config.app %>/css/{,**/}*.css'
          '<%= config.app %>/js/{,**/}*.js'
          '<%= config.app %>/images/{,**/}*.{png,jpg,jpeg}'
          '!<%= config.app %>/components/**'
        ]
        tasks: []
        options:
          livereload: config.livereload_port

    connect:
      server:
        options:
          port: config.server_port
          hostname: '0.0.0.0'
          middleware: (connect)->
            return [
              require('connect-livereload')(port: config.livereload_port)
              mountFolder(connect, config.tmp)
              mountFolder(connect, config.app)
            ]

    open:
      server:
        path: 'http://localhost:<%= connect.server.options.port %>'

    clean:
      dist: ['<%= config.dist %>']
      tmp: ['<%= config.tmp %>']
      tmp_dist: ['<%= config.tmp_dist %>']
      components: ['<%= config.dist %>/components']

    coffee:
      options:
        bare: true
      compile:
        expand: true
        cwd: '<%= config.src %>'
        src: ['**/*.coffee']
        dest: '<%= config.tmp %>/js'
        ext: '.jsx'
        
    react:
      compile:
        files: [{
          expand: true
          cwd: '<%= config.tmp %>'
          src: ['**/*.jsx']
          dest: '<%= config.tmp %>'
          ext: '.js'
        }]

    compass:
      options:
        sassDir: '<%= config.sass %>'
        cssDir: '<%= config.tmp %>/css'
        imagesDir: '<%= config.app %>/images'
        javascriptsDir: '<%= config.app %>/js'
        fontsDir: './css/fonts'
        importPath: ['<%= config.app %>/components']
        relativeAssets: true

      compile: 
        options:
          force: true
          outputStyle: 'compressed'
          environment: 'production'
      server:
        options:
          debugInfo: true

    copy:
      dist:
        files: [
          { expand: true, cwd: '<%= config.tmp %>/', src: ['**/*.js', '**/*.css'], dest: '<%= config.tmp_dist %>/' }
          { expand: true, cwd: '<%= config.app %>/', src: ['**'], dest: '<%= config.tmp_dist %>/' }
        ]
      require:
        files: [
          {
            expand: false
            src: ['<%= config.app %>/components/requirejs/require.js']
            dest: '<%= config.tmp %>/js/require.js'
          }
        ]

    requirejs:
      compile:
        options:
          baseUrl: 'js/'
          appDir: '<%= config.tmp_dist %>'
          dir: '<%= config.dist %>'
          skipDirOptimize: true
          removeCombined: true
          keepBuildDir: true
          preserveLicenseComments: false
          mainConfigFile: '<%= config.tmp_dist %>/js/main.js'
          optimize: 'uglify'
          name: 'main'

  
  grunt.registerTask('server', [
    'copy:require'
    'coffee:compile'
    'react:compile'
    'compass:server'
    'connect:server'
    'open:server'
    'watch'
  ])

  grunt.registerTask('compile', [
    'coffee:compile'
    'react:compile'
    'compass:server'
  ])

  grunt.registerTask('build', [
    'clean:dist'
    'clean:tmp'
    'clean:tmp_dist'
    'coffee:compile'
    'react:compile'
    'compass:compile'
    'copy:require'
    'copy:dist'
    'requirejs:compile'
    'clean:tmp'
    'clean:tmp_dist'
    'clean:components'
  ])

  grunt.registerTask('default', ['build'])
