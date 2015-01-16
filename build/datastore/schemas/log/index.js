var Schema, mongoose;

mongoose = require("mongoose");

Schema = mongoose.Schema;

exports.call = new Schema({
  query: {
    type: String,
    required: true
  },
  created: {
    type: Date,
    "default": Date.now,
    required: false
  }
});
