var ai, datastore, io, utils;

datastore = require("../datastore");

utils = require("../utils");

ai = require("../ai");

io = null;

exports.init = function(server) {
  io = require("socket.io").listen(server);
  return io.on("connection", function(socket) {
    console.log("STATUS [socket.io intialized]", socket.id);
    socket.emit("ready", {});
    socket.empty_count = 0;
    socket.no_result_count = 0;
    return socket.on("query", function(query) {
      query = utils.sanitizeQuery(query);
      console.log("query is", query);
      if (query && query.length && typeof query === "string") {
        return datastore.find(query, function(data) {
          var result;
          if (data) {
            socket.no_result_count = 0;
            result = data;
          } else {
            socket.no_result_count++;
            result = ai.noResult(socket.no_result_count);
          }
          return socket.emit("answers", result);
        });
      } else {
        socket.empty_count++;
        return socket.emit("answers", ai.empty(socket.empty_count));
      }
    });
  });
};
