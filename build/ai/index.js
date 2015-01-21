var defaults, i18n;

i18n = require("../i18n");

defaults = i18n.getDefaults.call();

exports.empty = function(count) {
  if (count < 2) {
    return defaults.EMPTY;
  } else {
    return defaults.STILL_EMPTY;
  }
};

exports.noResult = function(count) {
  if (count < 2) {
    return defaults.NO_RESULT;
  } else {
    return defaults.STILL_NO_RESULT;
  }
};
