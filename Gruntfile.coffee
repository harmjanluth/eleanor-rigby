module.exports = (grunt) ->

	# Project configuration.
	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'
		coffee:
			compile:
				options:
					join: true
					bare: true
				expand: true
				cwd: 'src'
				src: ['**/*.coffee']
				dest: 'build'
				ext: '.js'
		watch:
			app:
				files: 'src/**/*.coffee'
				tasks: 'coffee'
		copy:
			main:
				expand: true
				cwd: 'src'
				dest: 'build'
				src: [ 'client.html' ]

	# These plugins provide necessary tasks.
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-contrib-copy'
		
	# Default task.
	grunt.registerTask 'build', [ 'coffee', 'copy' ]