module.exports =
  dist:
    files: [
      { expand: true, cwd: '<%= tmp %>/', src: ['**/*.js', '**/*.css'], dest: '<%= tmp_dist %>/' }
      { expand: true, cwd: '<%= app %>/', src: ['**'], dest: '<%= tmp_dist %>/' }
    ]
  require:
    files: [
      {
        expand: false
        src: ['<%= app %>/components/requirejs/require.js']
        dest: '<%= tmp %>/js/require.js'
      }
    ]