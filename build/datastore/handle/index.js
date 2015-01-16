var HandleModel, findByTerms, mongo, mongoose, schemas, utils;

mongoose = require("mongoose");

mongo = require("mongodb");

schemas = require("../schemas");

utils = require("../../utils");

HandleModel = mongoose.model("Handle", schemas.handle);

exports.find = function(query, callback) {
  var lookup;
  lookup = HandleModel.find({
    query: query
  }).exec();
  return lookup.then(function(data) {
    console.log("LOOKUP BY QUER!!!!!Y");
    if (data.length) {
      return callback(data);
    } else {
      return findByTerms(query, callback);
    }
  });
};

findByTerms = function(query, callback) {
  var terms;
  console.log("STATUS [no query handles found, looking for terms..]");
  terms = utils.extractTerms(query);
  return HandleModel.aggregate([
    {
      $match: {
        terms: {
          $in: terms
        },
        type: "terms"
      }
    }, {
      $unwind: "$terms"
    }, {
      $match: {
        terms: {
          $in: terms
        }
      }
    }, {
      $limit: 1
    }, {
      $group: {
        _id: "$_id",
        answers: {
          $push: "$answer_ids"
        }
      }
    }, {
      $sort: {
        matches: -1
      }
    }
  ], function(error, data) {
    if (error) {
      console.log(error);
    } else {
      console.log("RESULT [handles:terms found: ]", data);
      return callback(data);
    }
  });
};
