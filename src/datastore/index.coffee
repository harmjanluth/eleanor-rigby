# Initialize
connect 			= require( "./connect" )
logQuery 			= require( "./logQuery" )
handle 				= require( "./handle" )
answer 				= require( "./answer" )

exports.logQuery 	= logQuery.call

exports.find = ( query, callback ) ->

	handle.find( query, (data) ->

		if data && data[0]

			# Return answers
			if data[0].answers && data[0].answers.length

				answer.find( data[0].answers, callback )

			# Function
			else if data[0].function

				console.log "STATUS [triggering function:" + data[0].function + "]"

				callback( data[0] )
	)

