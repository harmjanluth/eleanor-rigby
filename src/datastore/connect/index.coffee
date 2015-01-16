# Initialize
mongoose 			= require( "mongoose" )
mongo 				= require( "mongodb" )

# Setup globals
uristring 			= process.env.MONGOLAB_URI or "mongodb://localhost/pineapple"

# Setup mongo(ose) database
mongoose.connect uristring, (error, response) ->
	
	console.log ( if error then  "STATUS [ERROR connecting to: " + uristring + ". " + error + "]" else "STATUS [datastore connected to: " + uristring + "]" )