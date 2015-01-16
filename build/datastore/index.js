var connect, logQuery;

connect = require("./connect");

logQuery = require("./logQuery");

exports.logQuery = logQuery.call;
