datastore 			= require( "../datastore" )
io 					= null

exports.init = ( server ) ->

	io = require( "socket.io" ).listen( server )

	# Setup socket.io
	io.on "connection", ( socket ) ->
		
		console.log "STATUS [socket.io intialized]"

		# Send ready trigger
		socket.emit "ready", {}

		# Retrieve query input
		socket.on "query", ( data ) ->

			if data

				# Log this query to datastore
				datastore.logQuery( data )

				# ---------------- FIND EXACT QUESTION
				

				# ELSE: ---------------- EXTRACT TERMS

				# extracts 	= data.match(/("[^"]+"|[^"\s]+)/g)
				# terms 		= []
				# word 		= ""
				# i 			= 0
				# len 		= extracts.length
				
				# # Extract terms
				# while i < len
				# 	word = extracts[i]
				# 	terms.push word  if filter.indexOf(word) is -1
				# 	i++

				# console.log terms
