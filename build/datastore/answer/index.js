var AnswerModel, ObjectId, mongo, mongoose, schemas, utils;

mongoose = require("mongoose");

mongo = require("mongodb");

schemas = require("../schemas");

utils = require("../../utils");

ObjectId = mongoose.Types.ObjectId;

AnswerModel = mongoose.model("Answer", schemas.answer);

exports.find = function(ids, callback) {
  var lookup;
  if (ids == null) {
    ids = null;
  }
  if (ids) {
    if (typeof ids === "Array") {
      if (ids.length > 1) {
        lookup = AnswerModel.find({
          _id: {
            $in: ids
          }
        }).exec();
      } else {
        lookup = AnswerModel.findById(new ObjectId(ids[0])).exec();
      }
    }
    return lookup.then(function(data) {
      if (data.length) {
        return callback(data);
      } else {
        return console.log("ERROR [answers not found by id]");
      }
    });
  }
};
