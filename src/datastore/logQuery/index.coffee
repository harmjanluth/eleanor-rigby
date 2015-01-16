mongoose 			= require( "mongoose" )
mongo 				= require( "mongodb" )
schemas 			= require( "../schemas" )

LogModel 			= mongoose.model( "Log", schemas.log )

exports.call = ( query ) ->

	Log 		= new LogModel()
	Log.query 	= query

	# Save this log
	Log.save( ( error ) ->

		if error
			console.log "ERROR [could not save log] ", err
		else
			console.log "STATUS [log saved] ", Log

	)
