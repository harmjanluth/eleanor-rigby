mongoose 			= require( "mongoose" )
mongo 				= require( "mongodb" )
schemas 			= require( "../schemas" )
utils 				= require( "../../utils" )

# Methods
findByTerms 		= require( "./findByTerms" ).call

# Models
HandleModel 		= mongoose.model( "Handle", schemas.handle )

# Module
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

	lookup = HandleModel.findOne( query : query ).exec()

	lookup.then( ( data ) ->

		if data && data.length

			callback( data )

		else

			findByTerms( query, callback )
	)
	