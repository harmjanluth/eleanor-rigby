mongoose 			= require("mongoose")
Schema 				= mongoose.Schema

handle 				= require("./handle")
answer 				= require("./answer")
log 				= require("./log")
feedback 			= require("./feedback")

exports.handle 		= handle.call
exports.answer 		= answer.call
exports.log 		= log.call
exports.feedback	= feedback.call
