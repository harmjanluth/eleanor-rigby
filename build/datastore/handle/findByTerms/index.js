var HandleModel, mongo, mongoose, schemas, utils;

mongoose = require("mongoose");

mongo = require("mongodb");

schemas = require("../../schemas");

utils = require("../../../utils");

HandleModel = mongoose.model("Handle", schemas.handle);

exports.call = function(query, callback) {
  var terms;
  terms = utils.extractTerms(query);
  return HandleModel.aggregate([
    {
      $match: {
        terms: {
          $in: terms
        },
        type: "terms",
        handle: "answer"
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
        answer_ids: {
          $first: "$answer_ids"
        }
      }
    }
  ], function(error, data) {
    if (error) {
      console.log(error);
    } else {
      return callback(data);
    }
  });
};
