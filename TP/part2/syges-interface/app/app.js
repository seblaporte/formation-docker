var express             = require('express');
var path                = require('path');
var FileStreamRotator   = require('file-stream-rotator');
var logger              = require('morgan');
var fs                  = require('fs');
var cookieParser        = require('cookie-parser');
var bodyParser          = require('body-parser');
var db                  = require('./entities/mysql_database');

var logDirectory = __dirname + '/logs';

fs.existsSync(logDirectory) || fs.mkdirSync(logDirectory);

var accessLogStream = FileStreamRotator.getStream({
    date_format: 'DD-MM-YYYY',
    filename: logDirectory + '/access-%DATE%.log',
    frequency: 'daily',
    verbose: false
});

var userinfo = require('./routes/userinfo');
var password = require('./routes/password');

var app = express();

if (process.env.ENV === 'dev') {
    app.use(logger('dev'));
}
else {
    app.use(logger('combined', {stream: accessLogStream}))
}

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());

app.use('/userinfo', userinfo);
app.use('/password', password);

db.connect(function(error) {

    if (error) {
        console.log('Unable to connect to MySQL : ' + error);
        process.exit(1);
    }
});

// Catch 404 and forward to error handler
app.use(function(req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

// Error handler
app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.json({ error: err.message });
    console.log(err);
});

module.exports = app;
