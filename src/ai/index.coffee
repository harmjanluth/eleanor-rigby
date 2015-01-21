i18n 				= require( "../i18n" )
defaults			= i18n.getDefaults.call()

# What to do with emty reponse(s)?
exports.empty		= ( count ) ->

	if count < 2
		defaults.EMPTY
	else
		defaults.STILL_EMPTY

# No answers found
exports.noResult	= ( count ) ->

	if count < 2
		defaults.NO_RESULT
	else
		defaults.STILL_NO_RESULT

		