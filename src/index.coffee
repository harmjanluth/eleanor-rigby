# Initialize
app 				= require( "express" )()
server				= require( "http" ).Server( app )
io					= require( "socket.io" ).listen( server )
mongoose 			= require( "mongoose" )
mongo 				= require( "mongodb" )

# Setup globals
uristring 			= process.env.MONGOLAB_URI or "mongodb://localhost/pineapple"
base_directory		= process.cwd() or __dirname

console.log "Base directory is set to " + base_directory

# Set port (heroku)
app.set "port", ( process.env.PORT or 5000 )

# Serve index page
app.get "/", ( request, response ) ->
	response.sendFile( base_directory + "/client.html" )

# Setup mongo(ose) database
mongoose.connect uristring, (error, response) ->
	
	if error
		
		console.log "ERROR connecting to: " + uristring + ". " + error
	
	else

		console.log "Succeeded connected to: " + uristring
	
# Setup socket.io
io.on "connection", (socket) ->
	
	console.log "Socket.io active.."

	socket.emit "ready", {}

	socket.on "query", (data) ->

		ObjectID = mongo.ObjectID
	
		query =
			date : new Date().toString()
			text : data
			_id  : new ObjectID()

		mongoose.connection.collection( "queries" ).insert( query, (err,result) ->

			console.log result, err
		)


# Serve app
server.listen app.get( "port" ), ->
	
	console.log "App is running at port:" + app.get( "port" )