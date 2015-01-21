var answer, connect, feedback, handle, log;

connect = require("./connect");

handle = require("./models/handle");

answer = require("./models/answer");

log = require("./models/log");

feedback = require("./models/feedback");

exports.find = function(query, callback) {
  log.set(query);
  return handle.find(query, function(data) {
    if (data && data[0]) {
      global.SOCKET.last_handle = data[0]._id;
      if (data[0].answer_ids && data[0].answer_ids.length) {
        return answer.find(data[0].answer_ids, callback);
      } else if (data[0]["function"]) {
        console.log("STATUS [triggering function:" + data[0]["function"] + "]");
        return callback(data);
      }
    } else {
      return callback(null);
    }
  });
};
