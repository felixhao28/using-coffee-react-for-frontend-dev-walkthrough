module.exports = (grunt) ->
  require("load-grunt-tasks")(grunt)
  pkg = grunt.file.readJSON("package.json")
  grunt.initConfig
    pkg: pkg

    webpack:
      dist: require("./webpack.production.config.coffee")
  grunt.registerTask "dist", "distribute", ["webpack:dist"]