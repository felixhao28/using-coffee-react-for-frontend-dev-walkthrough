module.exports = (grunt) ->
  require("load-grunt-tasks")(grunt)
  pkg = grunt.file.readJSON("package.json")
  grunt.initConfig
    pkg: pkg
    cjsx:
      build:
        files: ["src/**/*.coffee"]
    sass:
      build:
        files: ["src/**/*.sass"]
    watch:
      cjsx:
        files: ["src/**/*.coffee"]
        tasks: ["newer:cjsx"]
  grunt.registerTask "build", "build", ["cjsx", "sass"]
  grunt.registerTask "default", "build & watch", ["build" "watch"]