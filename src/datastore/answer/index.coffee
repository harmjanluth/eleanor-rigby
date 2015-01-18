mongoose 			= require( "mongoose" )
mongo 				= require( "mongodb" )
schemas 			= require( "../schemas" )
utils 				= require( "../../utils" )

ObjectId 			= mongoose.Types.ObjectId

AnswerModel 		= mongoose.model( "Answer", schemas.answer )

exports.find = ( ids = null, callback ) ->

	if ids

		# Always return array
		lookup = AnswerModel.find(
			_id:
				$in: ids
		).exec()

		# Get promise
		lookup.then( ( data ) ->

			if data.length

				callback( data )

			else

				console.log "ERROR [answers not found by id]"
		)