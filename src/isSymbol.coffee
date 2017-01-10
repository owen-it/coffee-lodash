baseGetTag = require './.internal/baseGetTag'
isObjectLike = require './isObjectLike'

# `Object#toString` result references.
symbolTag = '[object Symbol]'

###
# Checks if `value` is classified as a `Symbol` primitive or object.
#
# @category Lang
# @param {*} value The value to check.
# @returns {boolean} Returns `true` if `value` is a symbol, else `false`.
# @example
#
# isSymbol(Symbol.iterator);
# // => true
#
# isSymbol('abc');
# // => false
###
isSymbol = (value) ->
	typeof value is 'symbol' or 
	(isObjectLike(value) and baseGetTag(value) is symbolTag)

module.exports = isSymbol
