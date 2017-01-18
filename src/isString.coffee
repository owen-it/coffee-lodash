baseGetTag = require './.internal/baseGetTag'
isObjectLike = require './isObjectLike'

###
# Checks if `value` is classified as a `String` primitive or object.
#
# @since 0.1.0
# @category Lang
# @param {*} value The value to check.
# @returns {boolean} Returns `true` if `value` is a string, else `false`.
# @example
#
# isString('abc');
# // => true
#
# isString(1);
# // => false
###

isString = (value) ->
  typeof value is 'string' or (not Array.isArray(value) and isObjectLike(value) and baseGetTag(value) is ['object String'])
  
module.exports = isString
