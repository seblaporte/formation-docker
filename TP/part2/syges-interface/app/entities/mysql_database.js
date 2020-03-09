var mysql = require('mysql');

var pool;

exports.connect = function(done){

    if (!process.env.DB_HOST)       { done('DB_HOST is undefined') }
    if (!process.env.DB_PASSWORD)   { done('DB_PASSWORD is undefined') }
    if (!process.env.DB_USER)       { done('DB_USER is undefined') }
    if (!process.env.DB_DATABASE)   { done('DB_DATABASE is undefined') }
    if (!process.env.DB_PORT)       { done('DB_PORT is undefined') }

    pool = mysql.createPool({
        connectionLimit : 10,
        host     : process.env.DB_HOST ,
        user     : process.env.DB_USER,
        password : process.env.DB_PASSWORD,
        database : process.env.DB_DATABASE,
        port     : process.env.DB_PORT
    });

    done();
};

exports.get = function() {
    
    return pool;
};
