mongoose 			= require( "mongoose" )
mongo 				= require( "mongodb" )
schemas 			= roquire( "datastore/schemas" )
utils 				= roquire( "utils" )

HandleModel 		= mongoose.model( "Handle", schemas.handle )

exports.call = ( query, callback ) ->

	# Get terms from query
	terms = utils.extractTerms( query )

	# Search in tags
	HandleModel.aggregate([
			
		{
			$match:
				terms:
					$in: terms
				type: "terms"
				handle: "answer"
		}
		{
			$unwind: "$terms"
		}
		{
			$match:
				terms:
					$in: terms
		}
		{
			$limit: 1
		}
		{
			$group:
				_id: "$_id"
				answer_ids:
					$first : "$answer_ids"
		}

	], ( error, data ) ->

		if error
			console.log error
			return
		else
			callback( data )
	)