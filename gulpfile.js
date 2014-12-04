var gulp       = require('gulp'),
    nodemon    = require('gulp-nodemon'),
    livereload = require('gulp-livereload');


gulp.task('develop', function () {
    livereload.listen();
    nodemon({
                script: 'bin/www',
                ext: 'js coffee jade'
            }).on('restart', function () {
        setTimeout(function () {
            livereload.changed();
        }, 500);
    });
});

gulp.task('default', [
    'develop'
]);

//node - p 'path = require("path"); exec = require("child_process").exec, child; child = exec("node " + path.join("bin", "www"), function (error, stdout, stderr) { console.log(stdout); console.log(stderr); if (error !== null) { console.log("exec error: " + error); }});'
//node - p 'path = require("path"); exec = require("child_process").exec, child; child = exec("node " + path.join("node_modules", "mocha", "bin", "mocha") + " --compilers coffee:coffee-script/register --recursive --reporter nyan", function (error, stdout, stderr) { console.log(stdout); console.error(stderr); if (error !== null) { console.error("exec error: " + error); }});'
/*
path = require(\"path\");
exec = require(\"child_process\").exec, child;
child = exec(\"node \" + path.join(\"node_modules\", \"mocha\", \"bin\", \"mocha\") + \" --compilers coffee:coffee-script/register --recursive --reporter nyan\", function (error, stdout, stderr) {
    console.log(stdout); console.error(stderr); if (error !== null) { console.error(\"exec error: \" + error); }
});'
*/
