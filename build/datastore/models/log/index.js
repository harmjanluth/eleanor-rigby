var LogModel, mongo, mongoose, schemas;

mongoose = require("mongoose");

mongo = require("mongodb");

schemas = roquire("datastore/schemas");

LogModel = mongoose.model("Log", schemas.log);

exports.set = function(query) {
  var lookup;
  return lookup = LogModel.findOne({
    query: query
  }, function(error, data) {
    var Log;
    if (error) {
      console.log(error);
      return;
    }
    if (data) {
      data.logged.push(new Date().toISOString());
      return data.save(function(error) {
        if (error) {
          return console.log("ERROR [could not save log] ", err);
        } else {
          return console.log("STATUS [log updated] ", data);
        }
      });
    } else {
      Log = new LogModel();
      Log.query = query;
      return Log.save(function(error) {
        if (error) {
          return console.log("ERROR [could not save log] ", err);
        } else {
          return console.log("STATUS [log saved] ", Log);
        }
      });
    }
  });
};
