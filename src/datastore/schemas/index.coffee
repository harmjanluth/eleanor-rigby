mongoose 		= require("mongoose")
Schema 			= mongoose.Schema

handle 			= require("./handle")
log 			= require("./log")

exports.handle 	= handle.call
exports.log 	= log.call