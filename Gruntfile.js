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
					src: ["**/*.jade", "!views/modules/*.jade"],
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
					"<%= paths.dist %>/css/styles.css": ['<%= paths.src %>/css/*.less']
				}
			},
			min: {
				options: {
					cleancss: true,
					report: 'min'
				},
				files: {
					"<%= paths.dist %>/css/styles.min.css": ['<%= paths.src %>/css/*.less']
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
					'<%= paths.dist %>/js/app.js': ['<%= paths.src %>/js/**/*.js']
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
				files: ['<%= paths.src %>/css/**/*.less'],
				tasks: ['build-css']
			},
			js: {
				files: ['<%= paths.src %>/js/**/*.js'],
				tasks: ['build-js']
			}
		}

	});

	/**
	 * Register grunt tasks
	 */
	grunt.registerTask('default', ['jade', 'less', 'concat', 'watch']);
	grunt.registerTask('build-html', ['jade']);
	grunt.registerTask('build-css', ['less']);
	grunt.registerTask('build-js', ['concat']);

};
