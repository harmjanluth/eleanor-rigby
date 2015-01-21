var FeedbackModel, mongo, mongoose, schemas;

mongoose = require("mongoose");

mongo = require("mongodb");

schemas = roquire("datastore/schemas");

FeedbackModel = mongoose.model("Feedback", schemas.feedback);

exports.set = function(handle_id, positive, used_query) {
  var lookup;
  if (used_query == null) {
    used_query = "";
  }
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
          feedback: positive,
          used_query: used_query
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
