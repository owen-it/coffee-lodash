###
Gets the first element of `array`.

@static
@memberOf _
@since 0.1.0
@alias first
@category Array
@param {Array} array The array to query.
@returns {*} Returns the first element of `array`.
@example
_.head([1, 2, 3]);
 // => 1

_.head([]);
 // => undefined
###

head = (arr) -> 
    length = arr?.length or 0
    if length then arr[0]

module.exports = head