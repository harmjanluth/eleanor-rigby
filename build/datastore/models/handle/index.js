var HandleModel, findByTerms, mongo, mongoose, schemas, utils;

mongoose = require("mongoose");

mongo = require("mongodb");

schemas = roquire("datastore/schemas");

utils = roquire("utils");

findByTerms = require("./findByTerms").call;

HandleModel = mongoose.model("Handle", schemas.handle);

exports.find = function(query, callback) {
  var lookup;
  lookup = HandleModel.findOne({
    query: query
  }).exec();
  return lookup.then(function(data) {
    if (data) {
      return callback(data);
    } else {
      return findByTerms(query, callback);
    }
  });
};
