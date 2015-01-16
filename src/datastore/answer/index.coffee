mongoose 			= require( "mongoose" )
mongo 				= require( "mongodb" )
schemas 			= require( "../schemas" )
utils 				= require( "../../utils" )

ObjectId 			= mongoose.Types.ObjectId

AnswerModel 		= mongoose.model( "Answer", schemas.answer )

exports.find = ( ids = null, callback ) ->

	if ids

		# Multiple
		if typeof ids is "Array"

			if ids.length > 1

				lookup = AnswerModel.find(
					_id:
						$in: ids
				).exec()

			else

				lookup = AnswerModel.findById( new ObjectId( ids[0] ) ).exec()


		# Get promise
		lookup.then( ( data ) ->

			if data.length

				callback( data )

			else

				console.log "ERROR [answers not found by id]"
		)