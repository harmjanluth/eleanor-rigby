var FeedbackModel, mongo, mongoose, schemas;

mongoose = require("mongoose");

mongo = require("mongodb");

schemas = require("../schemas");

FeedbackModel = mongoose.model("Feedback", schemas.feedback);

exports.call = function(handle_id, positive) {
  var lookup;
  return lookup = FeedbackModel.findOne({
    handle_id: handle_id
  }, function(error, data) {
    var Feedback;
    if (error) {
      console.log(error);
      return;
    }
    if (data) {
      data.logged.push({
        date: new Date().toISOString(),
        feedback: positive
      });
      return data.save(function(error) {
        if (error) {
          return console.log("ERROR [could not save feedback] ", err);
        } else {
          return console.log("STATUS [feedback updated] ", data);
        }
      });
    } else {
      Feedback = new FeedbackModel();
      Feedback.handle_id = handle_id;
      Feedback.logged = [
        {
          date: new Date().toISOString(),
          feedback: positive
        }
      ];
      return Feedback.save(function(error) {
        if (error) {
          return console.log("ERROR [could not save feedback] ", err);
        } else {
          return console.log("STATUS [feedback saved]", Feedback);
        }
      });
    }
  });
};
