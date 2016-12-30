###
Gets the last element of `array`.

@static
@memberOf _
@since 0.1.0
@category Array
@param {Array} array The array to query.
@returns {*} Returns the last element of `array`.
@example

_.last([1, 2, 3]);
// => 3
###
last = arr -> 
    length = arr?.length or 0
    if length then arr[length - 1] else undefined    

module.exports = last