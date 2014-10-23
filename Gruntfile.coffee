module.exports = (grunt) ->
	grunt.initConfig {
		pkg: grunt.file.readJSON 'package.json'

		var: {
			source: 'source/documents'
			destination: 'build'
		}

		connect: {
			server: {
				options: {
					base: '<%= var.destination %>'
					keepalive: true
				}
			}
		}

		copy: {
			main: {
				expand: true
				cwd: '<%= var.source %>'
				src: 'tests/the_raven/*'
				dest: '<%= var.destination %>'
			}
		}

		coffee: {
			main: {
				expand: true
				cwd: '<%= var.source %>'
				src: '**/*.coffee'
				dest: '<%= var.destination %>'
				ext: '.js'
			}
		}

		stylus: {
			main: {
				expand: true
				cwd: '<%= var.source %>'
				src: '**/*.styl'
				dest: '<%= var.destination %>'
				ext: '.css'
			}
		}

		jade: {
			main: {
				expand: true
				cwd: '<%= var.source %>'
				src: '**/*.jade'
				dest: '<%= var.destination %>'
				ext: '.html'
			}
		}
	}

	grunt.loadNpmTasks('grunt-contrib-connect');
	grunt.loadNpmTasks('grunt-contrib-copy');
	grunt.loadNpmTasks('grunt-contrib-coffee');
	grunt.loadNpmTasks('grunt-contrib-stylus');
	grunt.loadNpmTasks('grunt-contrib-jade');

	grunt.registerTask 'default', [ 'copy', 'coffee', 'stylus', 'jade' ]