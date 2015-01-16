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
			if query and query.length and typeof query is "string"

				# Log this query to datastore
				# datastore.logQuery( query )

				# Find handle
				# 
				datastore.handle.find query, ( data ) ->

					socket.emit "handles", data

				#console.log "QUERY RESULT:", handles

				#socket.emit "handles", handles

				# ELSE: ---------------- EXTRACT TERMS
				# console.log utils.extractTerms( data )

				
