var connect, handle, logQuery;

connect = require("./connect");

logQuery = require("./logQuery");

handle = require("./handle");

exports.logQuery = logQuery.call;

exports.handle = handle;
