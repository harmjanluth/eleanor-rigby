var answer, connect, handle, logQuery;

connect = require("./connect");

logQuery = require("./logQuery");

handle = require("./handle");

answer = require("./answer");

exports.logQuery = logQuery.call;

exports.find = function(query, callback) {
  return handle.find(query, function(data) {
    if (data && data[0]) {
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
