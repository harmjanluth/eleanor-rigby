var express = require('express');
var app = express();
var mongoose = require ("mongoose");
var uristring = process.env.MONGOLAB_URI || 'mongodb://localhost/tmp';

app.set('port', (process.env.PORT || 5000));

app.get('/', function(request, response) {
  response.send('[eleanor-rigby:tst]');
});

mongoose.connect(uristring, function (err, res) {
  if (err) { 
    console.log ('ERROR connecting to: ' + uristring + '. ' + err);
  } else {
    console.log ('Succeeded connected to: ' + uristring);
  }
});

app.listen(app.get('port'), function() {
  console.log("Node app is running at localhost:" + app.get('port'));
});