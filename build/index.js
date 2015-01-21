var app, base_directory, bunyan, cors, io, server, utils;

global.roquire = function(name) {
  return require(__dirname + "/" + name);
};

app = require("express")();

server = require("http").Server(app);

cors = require("cors");

bunyan = require("bunyan");

global.log = bunyan.createLogger({
  name: "app"
});

io = require("./io").init(server);

utils = require("./utils");

base_directory = process.env.IS_HEROKU ? process.cwd() + "/build" : __dirname;

global.SOCKET = {};

app.use(cors()).set("port", process.env.PORT || 5000).get("/", function(request, response) {
  return response.sendFile(__dirname + "/client.html");
});

server.listen(app.get("port"), function() {
  return console.log("STATUS [app running on :" + app.get("port") + "]");
});
