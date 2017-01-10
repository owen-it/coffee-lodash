# Used for built-in method references
objectProto = Object.prototype

# Used to check objects for own properties
hasOwnProperty = objectProto.hasOwnProperty

# Used to resolve the ['toString']
nativeObjectToString = objectProto.toString

# Built-in value references
symToStringTag = if Symbol then Symbol.toStringTag else undefined

###
# A specialized version of `baseGetTag` which ignores `Symbol.toStringTag` values.
#
# @private
# @param {*} value The value to query.
# @returns {string} Returns the raw `toStringTag`.
###
getRawTag = (value) -> 
		isOwn = hasOwnProperty.call value, symToStringTag
		tag = value[symToStringTag]
		unmasked = false

		try
			value[symToStringTag] = undefined
			unmasked = true
	
		result = nativeObjectToString.call(value)
		if unmasked 
			if isOwn
				value[symToStringTag] = tag
			else
				delete value[symToStringTag]

		result

module.exports = getRawTag
