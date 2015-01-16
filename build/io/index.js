var datastore, io, utils;

datastore = require("../datastore");

utils = require("../utils");

io = null;

exports.init = function(server) {
  io = require("socket.io").listen(server);
  return io.on("connection", function(socket) {
    console.log("STATUS [socket.io intialized]");
    socket.emit("ready", {});
    return socket.on("query", function(query) {
      if (query && query.length && typeof query === "string") {
        datastore.logQuery(query);
        return datastore.find(query, function(data) {
          return socket.emit("answers", data);
        });
      }
    });
  });
};
