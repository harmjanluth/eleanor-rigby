var LogModel, mongo, mongoose, schemas;

mongoose = require("mongoose");

mongo = require("mongodb");

schemas = require("../schemas");

LogModel = mongoose.model("Log", schemas.log);

exports.call = function(query) {
  var Log;
  Log = new LogModel();
  Log.query = query;
  return Log.save(function(error) {
    if (error) {
      return console.log("ERROR [could not save log] ", err);
    } else {
      return console.log("STATUS [log saved] ", Log);
    }
  });
};
