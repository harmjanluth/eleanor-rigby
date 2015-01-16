var Schema, mongoose;

mongoose = require("mongoose");

Schema = mongoose.Schema;

exports.call = new Schema({
  answer_ids: {
    type: Array,
    required: false
  },
  terms: {
    type: Array,
    required: false
  },
  query: {
    type: String,
    required: false
  },
  "function": {
    type: String,
    required: false
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
