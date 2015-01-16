mongoose 			= require( "mongoose" )
mongo 				= require( "mongodb" )
schemas 			= require( "../schemas" )

HandleModel 		= mongoose.model( "Handle", schemas.handle )

exports.find = ( query ) ->


	# Handle 				= new HandleModel()
	# Handle.global		= true
	# Handle.function		= "getTime"

	# # Save this log
	# Handle.save( ( error ) ->

	# 	if error
	# 		console.log "ERROR [could not save handle] ", err
	# 	else
	# 		console.log "STATUS [handle saved] ", Handle

	# )

	lookup = HandleModel.find()

	lookup.exec (err, handles) ->
		console.log err if err
		console.log "RESULT [handles found: ]" + handles