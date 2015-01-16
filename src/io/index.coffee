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

			# Check for input
			if query.length and typeof query is "string"

				# Log this query to datastore
				# datastore.logQuery( query )

				# Find handle
				console.log datastore.handle.find( query )

				# ELSE: ---------------- EXTRACT TERMS
				# console.log utils.extractTerms( data )

				
