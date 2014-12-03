require('coffee-script/register');

var express       = require('express');
var logger        = require('morgan');
var bodyParser    = require('body-parser');

var index         = require('./routes/index');
var lines_of_code = require('./routes/lines_of_code');

var app = express();

app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));


app.use('/', index);
app.use('/lines_of_code', lines_of_code);

/// catch 404 and forward to error handler
app.use(function (req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

/// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
    app.use(function (err, req, res, next) {
        res.status(err.status || 500).json(
            {
                error: err,
                error_message: err.message
            });
    });
}
// production error handler
// no stacktraces leaked to user
else {
    app.use(function (err, req, res, next) {
        app.use(function (err, req, res, next) {
            res.status(err.status || 500).json(
                {
                    error: 'Error',
                    error_message: err.message
                });
        });
    });
}

module.exports = app;
