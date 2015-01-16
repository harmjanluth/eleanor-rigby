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
      if (query.length && typeof query === "string") {
        return console.log(datastore.handle.find(query));
      }
    });
  });
};
