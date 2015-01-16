var mongo, mongoose;

mongoose = require("mongoose");

mongo = require("mongodb");

exports.call = function(query) {
  var ObjectID;
  ObjectID = mongo.ObjectID;
  query = {
    date: new Date().toString(),
    text: query,
    _id: new ObjectID()
  };
  return mongoose.connection.collection("queries").insert(query, function(err, result) {
    return console.log(result, err);
  });
};
