var Schema, answer, handle, log, mongoose;

mongoose = require("mongoose");

Schema = mongoose.Schema;

handle = require("./handle");

answer = require("./answer");

log = require("./log");

exports.handle = handle.call;

exports.answer = answer.call;

exports.log = log.call;
