module.exports = function(grunt){

	require("matchdep").filterDev("grunt-*").forEach(grunt.loadNpmTasks);

	grunt.initConfig({

		pkg: grunt.file.readJSON('package.json'),

		/**
		 * Define structure paths
		 */
		paths: {
			'dist': 'dist',
			'src': 'src'
		},

		/**
		 * Compile .jade files
		 * Pickup only files finded in source directory
		 * (not subdirectores)
		 */
		jade: {
			options: {
				pretty: true,
				data: {
					debug: true
				}
			},
			dist: {
				files: [{
					expand: true,
					src: [
						"**/*.jade",
						'!**/mixins/**'
					],
					dest: "<%= paths.dist %>/",
					cwd: "<%= paths.src %>/",
					ext: '.html'
				}]
			}
		},

		/**
		 * Compile all .less files
		 * @type {Object}
		 */
		less: {
			options: {
				banner: '/*!\n' +
						' * <%= pkg.name %>\n' +
						' * Version: <%= pkg.version %>\n' +
						' * <%= pkg.description %>\n' +
						' * Author: <%= pkg.author %>/\n' +
						' * Site: http://<%= pkg.homepage %>/\n' +
						' */\n' +
						''
			},
			normal: {
				files: {
					"<%= paths.dist %>/app/css/styles.css": ['<%= paths.src %>/app/css/*.less']
				}
			},
			min: {
				options: {
					cleancss: true,
					report: 'min'
				},
				files: {
					"<%= paths.dist %>/app/css/styles.min.css": ['<%= paths.src %>/app/css/*.less']
				}
			}
		},

		/**
		 * Merege all scripts into one file
		 */
		concat: {
			options: {
				separator: ';'
			},
			dist: {
				files: {
					'<%= paths.dist %>/app/app.js': ['<%= paths.src %>/app/**/*.js']
				}
			}
		},

		/**
		 * Minify mereged script file
		 */
		uglify: {
			options: {
				banner: '/*!\n' +
						' * <%= pkg.name %>\n' +
						' * Version: <%= pkg.version %>\n' +
						' * <%= pkg.description %>\n' +
						' * Author: <%= pkg.author %>\n' +
						' * Site: http://<%= pkg.homepage %>/\n' +
						' */\n' +
						'',
				report: 'min'
			},
			dist: {
				files: {
					'<%= paths.dist %>/app/app.min.js': ['<%= paths.dist %>/app/app.js']
				}
			}
		},

		/**
		 * Set watch observers
		 */
		watch: {
			options: {
				livereload: 9000,
			},
			html: {
				files: ['<%= paths.src %>/**/**/*.jade'],
				tasks: ['build-html']
			},
			css: {
				files: ['<%= paths.src %>/app/css/**/**/*.less'],
				tasks: ['build-css']
			},
			js: {
				files: ['<%= paths.src %>/app/**/**/*.js'],
				tasks: ['build-js']
			}
		}

	});

	/**
	 * Register grunt tasks
	 */
	grunt.registerTask('default', ['jade', 'less', 'concat', 'uglify', 'watch']);
	grunt.registerTask('build-html', ['jade']);
	grunt.registerTask('build-css', ['less']);
	grunt.registerTask('build-js', ['concat', 'uglify']);

};
