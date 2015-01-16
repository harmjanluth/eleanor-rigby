mongoose 			= require( "mongoose" )
mongo 				= require( "mongodb" )
schemas 			= require( "../schemas" )
utils 				= require( "../../utils" )

HandleModel 		= mongoose.model( "Handle", schemas.handle )

exports.find = ( query, callback ) ->

	# Handle 				= new HandleModel()
	# Handle.global			= true
	# Handle.function		= "getTime"

	# Save this log
	# Handle.save( ( error ) ->

	# 	if error
	# 		console.log "ERROR [could not save handle] ", error
	# 	else
	# 		console.log "STATUS [handle saved] ", Handle
	# )

	lookup = HandleModel.find( query : query ).exec()

	lookup.then( ( data ) ->

		console.log "LOOKUP BY QUER!!!!!Y"

		if data.length

			callback( data )

		else
			findByTerms( query, callback )
	)
	

findByTerms = ( query, callback ) ->

	console.log "STATUS [no query handles found, looking for terms..]"

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
				answers:
					$push: "$answer_ids"
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
			console.log "RESULT [handles:terms found: ]", data
			callback( data )
	)