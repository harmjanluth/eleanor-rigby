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

	lookup = HandleModel.findOne( query : query ).exec()

	lookup.then( ( data ) ->

		if data

			callback( data )

		else

			findByTerms( query, callback )
	)
	