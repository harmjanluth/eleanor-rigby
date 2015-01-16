mongoose 			= require( "mongoose" )
mongo 				= require( "mongodb" )
schemas 			= require( "../../schemas" )
utils 				= require( "../../../utils" )

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
				function:
					$first : "$function"
				global:
					$first : "$global"
				answers:
					$push : "$answer_ids"
		}
		{
			$sort:
				matches: -1
		}
	], ( error, data ) ->

		if error
			console.log error
			return
		else
			callback( data )
	)