express 			= require("express")
app 				= express()
mongoose 			= require("mongoose")
uristring 			= process.env.MONGOLAB_URI or "mongodb://localhost/pineapple"

app.set "port", ( process.env.PORT or 5000 )
app.get "/", ( request, response ) ->
  response.send "[eleanor-rigby:tst]"
  return

mongoose.connect uristring, (err, res) ->
  if err
    console.log "ERROR connecting to: " + uristring + ". " + err
  else
    console.log "Succeeded connected to: " + uristring
  return

app.listen app.get("port"), ->
  console.log "Node app is running at localhost:" + app.get("port")
  return