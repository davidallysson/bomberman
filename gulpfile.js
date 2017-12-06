var gulp = require('gulp'),
    sass = require('gulp-ruby-sass'),
    minifycss = require('gulp-minify-css'),
    livereload = require('gulp-livereload');

gulp.task('scss', function() {
  sass('css/style.scss').on('error', sass.logError)
  .pipe(minifycss())
  .pipe(gulp.dest('css'))
  .pipe(livereload());
});

gulp.task('html', function() {
  gulp.src('*.html').pipe(livereload());
});

gulp.task('watch', function() {
  livereload.listen();
  gulp.watch('**/*.html', ['html']);
  gulp.watch('css/*.{sass,scss}', ['scss'] );
});
