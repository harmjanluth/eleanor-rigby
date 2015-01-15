var app, base_directory, io, isHeroku, mongo, mongoose, server, uristring;

app = require("express")();

server = require("http").Server(app);

io = require("socket.io").listen(server);

mongoose = require("mongoose");

mongo = require("mongodb");

isHeroku = process.env.IS_HEROKU || false;

uristring = process.env.MONGOLAB_URI || "mongodb://localhost/pineapple";

base_directory = isHeroku ? process.cwd() + "/build" : __dirname;

app.set("port", process.env.PORT || 5000);

app.get("/", function(request, response) {
  return response.sendFile(__dirname + "/client.html");
});

mongoose.connect(uristring, function(error, response) {
  if (error) {
    return console.log("ERROR connecting to: " + uristring + ". " + error);
  } else {
    return console.log("Succeeded connected to: " + uristring);
  }
});

io.on("connection", function(socket) {
  console.log("Socket.io active..");
  socket.emit("ready", {});
  return socket.on("query", function(data) {
    var ObjectID, query;
    ObjectID = mongo.ObjectID;
    query = {
      date: new Date().toString(),
      text: data,
      _id: new ObjectID()
    };
    return mongoose.connection.collection("queries").insert(query, function(err, result) {
      return console.log(result, err);
    });
  });
});

server.listen(app.get("port"), function() {
  return console.log("App is running at port:" + app.get("port"));
});
