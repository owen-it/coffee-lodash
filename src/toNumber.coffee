isObject = require './isObject'
isSymbol = require './isSymbol'

# Used as references for various 'Number' constats.
NAN = 0 / 0

# Used to match leading and trailing whitespace.
reTrim = /^\s+|\s+$/g

# Used to detect bad signed hexadecimal string values.
reIsBadHex = /^[-+]0x[0-9a-f]+$/i

# Used to detect binary string values.
reIsBinary = /^0b[01]+$/i

# Used to detect octal string values.
reIsOctal = /^0o[0-7]+$/i

# Built-in method references without a dependency on 'root'.
freeParseInt = parseInt

###
# Converts 'value' to a number
#
# @category lang
# @param {*} value The value to process.
# @returns {number} Returns the number
# @example
#
# toNumber 3.2
# // => 3.2
#
# toNumber Number.MIN_VALUE
# // => 5e-324
#
# toNumber '3.2'
# // => 3.2
###
toNumber = (value) ->
    if typeof value is 'number' 
        return value
    
    if isSymbol value 
        return NAN
    
    if isObject value
        other = value;
        other = value.valueOf() if typeof value.valueOf is 'function'
    
    if typeof value isnt 'string'
        return if value is 0 then value else +value
        
    value = value.replace reTrim, ''
    isBinary = reIsBinary.test value
    
    return if (isBinary or reIsOctal.test value)
        freeParseInt(value.slice(2), if isBinary then 2 else 8)
    else
        if reIsBadHex.test value then NAN else +value 
        
module.exports = toNumber
        
