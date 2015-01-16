var HandleModel, mongo, mongoose, schemas;

mongoose = require("mongoose");

mongo = require("mongodb");

schemas = require("../schemas");

HandleModel = mongoose.model("Handle", schemas.handle);

exports.find = function(query) {
  var lookup;
  lookup = HandleModel.find();
  return lookup.exec(function(err, handles) {
    if (err) {
      console.log(err);
    }
    return console.log("RESULT [handles found: ]" + handles);
  });
};
