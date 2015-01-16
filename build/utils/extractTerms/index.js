var filter;

filter = require("../filter")();

exports.call = function(text) {
  var extracts, i, len, terms, word;
  extracts = text.match(/("[^"]+"|[^"\s]+)/g);
  terms = [];
  word = "";
  i = 0;
  len = extracts.length;
  while (i < len) {
    word = extracts[i];
    if (filter.indexOf(word) === -1) {
      terms.push(word);
    }
    i++;
  }
  return terms;
};
