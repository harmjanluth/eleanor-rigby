mongoose 			= require( "mongoose" )
mongo 				= require( "mongodb" )
schemas 			= roquire( "datastore/schemas" )

LogModel 			= mongoose.model( "Log", schemas.log )

exports.set = ( query ) ->

	lookup 		= LogModel.findOne( query : query, ( error, data ) ->

		if error
			console.log error
			return

		# Existing query
		if data

			data.logged.push( new Date().toISOString() )

			# Save this log
			data.save( ( error ) ->

				if error
					console.log "ERROR [could not save log] ", err
				else
					console.log "STATUS [log updated] ", data

			)

		# New query
		else

			Log 		= new LogModel()
			Log.query 	= query

			# Save this log
			Log.save( ( error ) ->

				if error
					console.log "ERROR [could not save log] ", err
				else
					console.log "STATUS [log saved] ", Log

			)
	)

	
