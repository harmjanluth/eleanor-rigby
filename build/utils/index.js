var extractTerms, sanitizeQuery;

extractTerms = require("./extractTerms");

sanitizeQuery = require("./sanitizeQuery");

exports.extractTerms = extractTerms.call;

exports.sanitizeQuery = sanitizeQuery.call;
