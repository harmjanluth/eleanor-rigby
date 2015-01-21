var Schema, mongoose;

mongoose = require("mongoose");

Schema = mongoose.Schema;

exports.call = new Schema({
  handle_id: {
    type: Schema.Types.ObjectId,
    required: true
  },
  created: {
    type: Date,
    "default": Date.now,
    required: false
  },
  logged: {
    type: Array,
    required: true
  }
});
