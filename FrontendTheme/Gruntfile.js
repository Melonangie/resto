module.exports = function(grunt) {

    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),

        less: {
            development: {
                options: {
                    compress: false
                },
                files: {
                    "css/main.css": "less/main.less"
                }
            },
        },

        concat: {
            options: {
                separator: ';',
            },
            top: {
                src: [
                    'bower_components/kendo-ui/src/js/kendo.web.js',
                    'bower_components/kendo-ui/src/js/cultures/kendo.culture.es-MX.js'
                ],
                dest: 'js/top.js',
            },
            bottom: {
                src: [
                    'bower_components/bootstrap/js/alert.js',
                    'bower_components/bootstrap/js/popover.js',
                    'bower_components/bootstrap/js/tooltip.js',
                    'bower_components/bootstrap/js/transition.js',
                    'bower_components/bootstrap/js/dropdown.js',
                    'bower_components/bootstrap/js/collapse.js',
                    'bower_components/jquery.breakpoints/breakpoints.js',
                    'bower_components/jquery.slimscroll/jquery.slimscroll.js',
                    'js/core.js'
                ],
                dest: 'js/bottom.js',
            },
            ie: {
                src: [
                    'bower_components/html5shiv/dist/html5shiv.js',
                    'bower_components/html5shiv/dist/html5shiv-printshiv.js',
                    'bower_components/respond/src/respond.js.js'
                ],
                dest: 'js/ie.js',
            },
        },

        uglify: {
            options: {
                mangle: false
            },
            top: {
                files: {
                    'js/top.min.js': [
                        'js/jquery.min.js',
                        'js/top.js'
                    ]
                }
            },
            bottom: {
                files: {
                    'js/bottom.min.js': [
                        'bower_components/sidr/jquery.sidr.min.js',
                        'bower_components/pace/pace.min.js',
                        'js/bottom.js'
                    ]
                }
            },
            ie: {
                files: {
                    'js/ie.min.js': ['js/ie.js']
                }
            },
        },

        watch: {
            less: {
                files: ['less/*.less'],
                tasks: ['less']
            },
        }

    });

    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.registerTask('default', ['watch']);

}
