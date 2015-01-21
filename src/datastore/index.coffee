# DATASTORE

# Initialize
connect 				= require( "./connect" )

handle 					= require( "./models/handle" )
answer 					= require( "./models/answer" )
log 					= require( "./models/log" )
feedback 				= require( "./models/feedback" )


exports.find = ( query, callback ) ->

	# Save log for this query
	log.set( query )

	handle.find( query, ( data ) ->

		if data && data[0]

			# Store last handle for feedback
			global.SOCKET.last_handle = data[0]._id

			# Return answers
			if data[0].answer_ids && data[0].answer_ids.length

				answer.find( data[0].answer_ids, callback )

			# Function
			else if data[0].function

				console.log "STATUS [triggering function:" + data[0].function + "]"

				callback( data )

		else

			callback( null )

	)

