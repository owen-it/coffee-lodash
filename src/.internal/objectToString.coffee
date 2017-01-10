###
# Used to resolve the
# [`toStringTag`](http://ecma-international.org/ecma-262/7.0/#sec-object.prototype.tostring) 
# of values.
###
nativeObjectToString = Object.prototype.toString

###
# Converts `value` to a string using `Object.prototype.toString`.
# 
# @private
# @param {*} value The value to convert.
# @returns {string} Returns the converted string.
###
objectToString = (value) ->
	nativeObjectToString.call(value)

module.exports = objectToString
