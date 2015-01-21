mongoose 			= require( "mongoose" )
mongo 				= require( "mongodb" )
schemas 			= roquire( "datastore/schemas" )

FeedbackModel 		= mongoose.model( "Feedback", schemas.feedback )

exports.set = ( handle_id, positive, used_query = "" ) ->

	lookup 		= FeedbackModel.findOne( handle_id : handle_id, ( error, data ) ->

		if error
			console.log error
			return

		# Existing feedback
		if data

			data.logged.push( { date : new Date().toISOString(), feedback : positive } )

			# Save this log
			data.save( ( error ) ->

				if error
					console.log "ERROR [could not save feedback] ", err
				else
					console.log "STATUS [feedback updated] ", data

			)

		# New feedback
		else

			Feedback 				= new FeedbackModel()
			Feedback.handle_id		= handle_id
			Feedback.logged			= [ { date : new Date().toISOString(), feedback : positive, used_query : used_query }  ]

			# Save this log
			Feedback.save( ( error ) ->

				if error
					console.log "ERROR [could not save feedback] ", err
				else
					console.log "STATUS [feedback saved]", Feedback

			)
	)

	
