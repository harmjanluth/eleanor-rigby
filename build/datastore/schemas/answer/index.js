var Schema, mongoose;

mongoose = require("mongoose");

Schema = mongoose.Schema;

exports.call = new Schema({
  text: {
    type: String,
    required: true
  },
  created: {
    type: Date,
    "default": Date.now,
    required: false
  },
  updated: {
    type: Date,
    "default": Date.now,
    required: true
  },
  global: {
    type: Boolean,
    "default": true,
    required: true
  }
});
