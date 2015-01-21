datastore 			= roquire( "datastore" )
utils 				= roquire( "utils" )
ai 					= roquire( "ai" )
io 					= null

exports.init = ( server ) ->

	# connect
	io = require( "socket.io" ).listen( server )

	# Setup socket.io
	io.on "connection", ( socket ) ->
		
		log.info "[socket.io intialized]", socket.id

		# Send ready trigger
		socket.emit "ready", {}
		socket.empty_count = 0
		socket.no_result_count = 0

		# Retrieve query input
		socket.on "query", ( query ) ->

			# Cleanup query
			query = utils.sanitizeQuery( query )

			if query and query.length and typeof query is "string"

				# Find handle
				# 
				datastore.find query, ( data ) ->

					if data

						# Reset count
						global.SOCKET.last_query = query
						socket.no_result_count = 0
						
						result = data

					else

						socket.no_result_count++
						result = ai.noResult( socket.no_result_count )

					# Emit result
					log.info "[answer results]", result
					socket.emit "answers", result
			else

				# Count questions
				# 
				socket.empty_count++
				socket.emit "answers", ai.empty( socket.empty_count )


		# Get feedback from last handle
		socket.on "feedback", ( positive = null ) ->

			if global.SOCKET.last_handle
				
				datastore.feedback.set( global.SOCKET.last_handle, positive, global.SOCKET.last_query )