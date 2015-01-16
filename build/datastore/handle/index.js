var HandleModel, mongo, mongoose, schemas, utils;

mongoose = require("mongoose");

mongo = require("mongodb");

schemas = require("../schemas");

utils = require("../../utils");

HandleModel = mongoose.model("Handle", schemas.handle);

exports.find = function(query) {
  var lookup, result, terms;
  result = [];
  lookup = HandleModel.find({
    query: query
  }, function(error, data) {
    if (error) {
      console.log(error);
    }
    console.log("RESULT [handles found: ]" + data);
    return result = data;
  });
  if (!result.length) {
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
    ], function(error, result) {
      if (error) {
        return console.log(error);
      } else {
        return console.log("RESULT [handles found: ]", result);
      }
    });
  }
};
