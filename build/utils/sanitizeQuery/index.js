exports.call = function(input) {
  return input.replace(/[^\w\s]/gi, '').toLowerCase();
};
