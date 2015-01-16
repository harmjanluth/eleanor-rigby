mongoose 	= require( "mongoose" )
Schema 		= mongoose.Schema

exports.call = new Schema(

	# List of compatible answers, not required with function
	answer_ids:
		type: Array
		required: false

	# List of attached tags, not used with query
	terms:
		type: Array
		required: false

	# String that matches the input query
	query:
		type: String
		required: false

	# Function to call if query or terms match
	function:
		type: String
		required: false

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