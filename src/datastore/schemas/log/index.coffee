mongoose 	= require( "mongoose" )
Schema 		= mongoose.Schema

exports.call = new Schema(

	# String that matches the input query
	query:
		type: String
		required: true

	# Create date
	created:
		type: Date
		default : Date.now
		required: false

	# Create date
	logged:
		type: Array
		required: false

)