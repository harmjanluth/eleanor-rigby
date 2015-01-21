var ai, datastore, io, utils;

datastore = roquire("datastore");

utils = roquire("utils");

ai = roquire("ai");

io = null;

exports.init = function(server) {
  io = require("socket.io").listen(server);
  return io.on("connection", function(socket) {
    log.info("[socket.io intialized]", socket.id);
    socket.emit("ready", {});
    socket.empty_count = 0;
    socket.no_result_count = 0;
    socket.on("query", function(query) {
      query = utils.sanitizeQuery(query);
      if (query && query.length && typeof query === "string") {
        return datastore.find(query, function(data) {
          var result;
          if (data) {
            global.SOCKET.last_query = query;
            socket.no_result_count = 0;
            result = data;
          } else {
            socket.no_result_count++;
            result = ai.noResult(socket.no_result_count);
          }
          log.info("[answer results]", result);
          return socket.emit("answers", result);
        });
      } else {
        socket.empty_count++;
        return socket.emit("answers", ai.empty(socket.empty_count));
      }
    });
    return socket.on("feedback", function(positive) {
      if (positive == null) {
        positive = null;
      }
      if (global.SOCKET.last_handle) {
        return datastore.feedback.set(global.SOCKET.last_handle, positive, global.SOCKET.last_query);
      }
    });
  });
};
