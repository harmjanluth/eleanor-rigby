# Initialize
filter 				= require( "../filter" )()

exports.call = ( text ) ->

	extracts 	= text.match(/("[^"]+"|[^"\s]+)/g)
	terms 		= []
	word 		= ""
	i 			= 0
	len 		= extracts.length
	
	# Extract terms
	while i < len
		word = extracts[i]
		terms.push word  if filter.indexOf(word) is -1
		i++

	return terms