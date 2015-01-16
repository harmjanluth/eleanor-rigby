# Initialize
app 				= require( "express" )()
server				= require( "http" ).Server( app )

# Global
io 					= require( "./io" ).init( server )
utils 				= require( "./utils" )
base_directory		= if process.env.IS_HEROKU then ( process.cwd() + "/build" ) else __dirname

# Set port (heroku)
app.set "port", ( process.env.PORT or 5000 )

# Serve index page
app.get "/", ( request, response ) ->
	response.sendFile( __dirname + "/client.html" )

# Serve app
server.listen app.get( "port" ), ->
	console.log "STATUS [app running on :" + app.get( "port" ) + "]"