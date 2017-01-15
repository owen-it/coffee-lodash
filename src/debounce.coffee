isObject = require './isObject'
toNumber = require './toNumber'

# Built-in method references for those with the same name as other 'lodash' methos.
nativeMax = Math.max
nativeMin = Math.min

debounce = (func, wait, options) ->
    lastArgs = null
    lastThis = null
    result = null
    lastInvokeTime = 0
    lastCallTime = null
    leading = no
    maxing = no
    timerId = null
    trailing = yes
    
    if typeof func isnt 'function' 
        throw new TypeError 'Expected a function'
        
    wait = toNumber(wait) or 0
    if isObject options 
        leading = !!options.leading
        maxing = 'maxing' in options
        maxWait = if maxing then nativeMax toNumber(options.maxWait) or 0, wait else maxWait
        trailing = if 'trailing' in options then !!options.trailing else trailing
    
    invokeFunc = (time) ->
        args = lastArgs
        thisArgs = lastThis
        
        lastArgs = lastThis = undefined
        lastInvokeTime = time
        result = func.apply thisArgs, args
        
    leadingEdge = (time) ->
        # Reset any 'maxWait' timer.
        lastInvokeTime = time
        
        # Start the timer for the trailing edge.
        timerId = setTimeout timerExpired, wait
        
        # Invoke the leading edge.
        if leading then invokeFunc time else result
        
    remainigWait = (time) ->
        timeSinceLastCall = time - lastCallTime
        timeSinceLastInvoke = time - lastInvokeTime
        
        result = wait - timeSinceLastCall
        if nativeMin result, maxWait - timeSinceLastInvoke then maxing else result
