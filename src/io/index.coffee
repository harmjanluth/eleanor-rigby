datastore 			= require( "../datastore" )
utils 				= require( "../utils" )
ai 					= require( "../ai" )
io 					= null

exports.init = ( server ) ->

	# connect
	io = require( "socket.io" ).listen( server )

	# Setup socket.io
	io.on "connection", ( socket ) ->
		
		console.log "STATUS [socket.io intialized]", socket.id

		# Send ready trigger
		socket.emit "ready", {}

		socket.empty_count = 0
		socket.no_result_count = 0

		# Retrieve query input
		socket.on "query", ( query ) ->

			# Cleanup query
			query = utils.sanitizeQuery( query )

			console.log "query is", query

			if query and query.length and typeof query is "string"

				# Log this query to datastore
				# datastore.logQuery( query )

				# Find handle
				# 
				datastore.find query, ( data ) ->

					if data

						# Reset count
						socket.no_result_count = 0
						result = data

					else

						socket.no_result_count++
						result = ai.noResult( socket.no_result_count )


					# Emit result
					socket.emit "answers", result

			else

				# Count questions
				# 
				socket.empty_count++
				socket.emit "answers", ai.empty( socket.empty_count )
