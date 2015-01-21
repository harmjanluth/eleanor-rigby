# Setup better require
global.roquire = (name) ->
  require __dirname + "/" + name

# Initialize
app 				= require( "express" )()
server				= require( "http" ).Server( app )
cors 				= require( "cors" )

bunyan 				= require("bunyan")
global.log 			= bunyan.createLogger(name: "app")

# Global
io 					= require( "./io" ).init( server )
utils 				= require( "./utils" )
base_directory		= if process.env.IS_HEROKU then ( process.cwd() + "/build" ) else __dirname


# Global collections
global.SOCKET		= {}

# Set port (heroku)
app
	.use(cors())
	.set "port", ( process.env.PORT or 5000 )
	.get "/", ( request, response ) ->
		response.sendFile( __dirname + "/client.html" )

# Serve app
server.listen app.get( "port" ), ->
	
	console.log "STATUS [app running on :" + app.get( "port" ) + "]"