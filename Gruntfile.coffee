module.exports = (grunt) ->
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-jade')
  grunt.loadNpmTasks('grunt-contrib-stylus')
  grunt.loadNpmTasks("grunt-contrib-watch")
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    coffee:
      options:
        sourceMap: false
        bare: true
      compile:
        files:
          "dist/server.js": ["lib/*.coffee"]
          "dist/public/index.js": ["lib/public/*.coffee"]
    jade:
      options:
        pretty: true
        data:
          timestamp: "<%= new Date() %>"
      compile:
        files:
          'dist/public/index.html': ['lib/public/*.jade']
    stylus:
      compile:
        options:
          compress: false
          urlfunc: 'embedurl'
        files:
          'dist/public/index.css': ['lib/public/*.styl']
    watch:
      gruntfile:
        files:["gruntfile.coffee", "package.json"]
        tasks:["make"]
      coffee:
        files:["lib/**/*.coffee"]
        tasks:["coffee:compile"]
      stylus:
        files:["lib/**/*.styl"]
        tasks:["stylus:compile"]
      jade:
        files:["lib/**/*.jade"]
        tasks:["jade:compile"]
  grunt.registerTask("compile", ["coffee:compile", "jade:compile", "stylus:compile"])
  grunt.registerTask("make", ["compile"])
  grunt.registerTask("default", ["make"])
