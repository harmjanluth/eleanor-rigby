mongoose 	= require( "mongoose" )
Schema 		= mongoose.Schema

exports.call = new Schema(

	# String that matches the input query
	handle_id:
		type: Schema.Types.ObjectId
		required: true

	# Create date
	created:
		type: Date
		default : Date.now
		required: false

	# Create date
	logged:
		type: Array
		required: true

)