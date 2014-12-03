#!/usr/bin/env node
//var debug = require('debug')('expressapp');
var app = require('./app');

app.set('port', process.env.PORT || 3000);

var server = app.listen(app.get('port'), function() {
    console.info(''.concat(
        'Express server listening on port ',
        server.address().port)
    )
});
