var mongo, mongoose, uristring;

mongoose = require("mongoose");

mongo = require("mongodb");

uristring = process.env.MONGOLAB_URI || "mongodb://localhost/pineapple";

mongoose.connect(uristring, function(error, response) {
  return console.log((error ? "STATUS [ERROR connecting to: " + uristring + ". " + error + "]" : "STATUS [datastore connected to: " + uristring + "]"));
});
