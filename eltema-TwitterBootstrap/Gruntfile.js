module.exports = function(grunt) {

    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),

        concat: {
            options: {
                stripBanners: {
                    block: true
                },
                separator: '\n /* ----- */ \n',
            },
            js: {
                src: 'src/js/*.js',
                dest: 'dest/js/concat-js.js'
            },
            ie: {
                src: [
                    'bower_components/html5shiv/dist/html5shiv.js',
                    'bower_components/html5shiv/dist/html5shiv-printshiv.js',
                    'bower_components/respond/dest/respond.min.js'
                ],
                dest: 'dest/js/ie.js'
            },
            pluginsjs: {
                src: [
                    'bower_components/kendo-ui/js/jquery.min.js',
                    'bower_components/kendo-ui/js/kendo.web.min.js',
                    'bower_components/kendo-ui/js/cultures/kendo.culture.es-MX.min.js',
                    'bower_components/bootstrap/js/bootstrap.min.js',
                    'bower_components/jquery.breakpoints/breakpoints.js',
                    'bower_components/pace/pace.min.js',
                    '/bower_components/jquery.slimscroll/jquery.slimscroll.min.js',
                    'bower_components/unveil/jquery.unveil.min.js'
                ],
                dest: 'dest/js/plugins.js'
            },
            pluginscss: {
                src: [
                    'bower_components/pace/pace-theme-flash.css',
                    'bower_components/sidr/css/jquery.sidr.light.css',
                    'bower_components/fontawesome/css/font-awesome.min.css',
                    'bower_components/bootstrap/css/bootstrap.min.css'
                ],
                dest: 'dest/css/plugins.css'
            }
        },

        uglify: {
            js: {
                src: 'dest/js/concat-js.js',
                dest: 'dest/js/js.js'
            }
        },

        less: {
            options: {
                compress: false
            },
            css: {
                src: 'src/less/main.less',
                dest: 'dest/css/main.css'
            }
        },

        watch: {
            less: {
                files: ['src/less/*.less'],
                tasks: ['less']
            }
        }

    });

    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.registerTask('default', ['concat']);

}
