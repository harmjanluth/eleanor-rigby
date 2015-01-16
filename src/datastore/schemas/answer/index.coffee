mongoose 	= require( "mongoose" )
Schema 		= mongoose.Schema

exports.call = new Schema(

	# String that matches the input query
	text:
		type: String
		required: true

	# Create date
	created:
		type: Date
		default : Date.now
		required: false

	# Update date
	updated:
		type: Date
		default : Date.now
		required: true

	# Global handle or custom
	global:
		type: Boolean
		default : true
		required: true
)