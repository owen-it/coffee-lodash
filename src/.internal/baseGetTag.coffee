getRawTag = require './getRawTag'
objectToString = require './objectToString'

# `Object#toString` result references.
nullTag = '[object Null]'
undefinedTag = '[object Undefined]'

# Built-in value references
symToStringTag =  if Symbol then Symbol.toStringTag else undefined

###
# The base implementation of `getTag` without fallbacks for buggy environments.
# 
# @private
# @param {*} value The value to query.
# @returns {string} Returns the `toStringTag`.
###
baseGetTag = (value) ->
	if !value?
	 	return if value is undefined then undefinedTag else nullTag

	if (symToStringTag and symToStringTag in Object(value)) 
		getRawTag value 
	else 
		objectToString value

module.exports = baseGetTag
