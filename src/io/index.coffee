datastore 			= require( "../datastore" )
utils 				= require( "../utils" )
io 					= null

exports.init = ( server ) ->

	# connect
	io = require( "socket.io" ).listen( server )

	# Setup socket.io
	io.on "connection", ( socket ) ->
		
		console.log "STATUS [socket.io intialized]"

		# Send ready trigger
		socket.emit "ready", {}

		# Retrieve query input
		socket.on "query", ( query ) ->

			if query and typeof query is "string"

				# Clean up
				query = utils.sanitizeQuery( query )

				# Check for input
				if query.length

					# Log this query to datastore
					datastore.logQuery( query )

					# Find handle
					# 
					datastore.find query, ( data ) ->

						socket.emit "answers", data
				
