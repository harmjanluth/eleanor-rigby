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
		socket.on "query", ( data ) ->

			# Check for input
			if data.length and typeof data is "string"

				# Log this query to datastore
				datastore.logQuery( data )

				# ---------------- FIND EXACT QUESTION
				

				# ELSE: ---------------- EXTRACT TERMS

				console.log utils.extractTerms( data )

				
