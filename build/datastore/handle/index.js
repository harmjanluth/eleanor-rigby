var HandleModel, findByTerms, mongo, mongoose, schemas, utils;

mongoose = require("mongoose");

mongo = require("mongodb");

schemas = require("../schemas");

utils = require("../../utils");

findByTerms = require("./findByTerms").call;

HandleModel = mongoose.model("Handle", schemas.handle);

exports.find = function(query, callback) {
  var lookup;
  lookup = HandleModel.findOne({
    query: query
  }).exec();
  return lookup.then(function(data) {
    if (data && data.length) {
      return callback(data);
    } else {
      return findByTerms(query, callback);
    }
  });
};
