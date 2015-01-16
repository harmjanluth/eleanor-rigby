var app, base_directory, io, server, utils;

app = require("express")();

server = require("http").Server(app);

io = require("./io").init(server);

utils = require("./utils");

base_directory = process.env.IS_HEROKU ? process.cwd() + "/build" : __dirname;

app.set("port", process.env.PORT || 5000);

app.get("/", function(request, response) {
  return response.sendFile(__dirname + "/client.html");
});

server.listen(app.get("port"), function() {
  return console.log("STATUS [app running on :" + app.get("port") + "]");
});
