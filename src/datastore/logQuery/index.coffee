mongoose 			= require( "mongoose" )
mongo 				= require( "mongodb" )

exports.call = ( query ) ->

	ObjectID 	= mongo.ObjectID
	
	query =
		date : new Date().toString()
		text : query
		_id  : new ObjectID()

	mongoose.connection.collection( "queries" ).insert( query, ( err,result ) ->

		console.log result, err
	)
