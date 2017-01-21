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
            
    shouldInvoke = (time) ->
        timeSinceLastCall = time -lastCallTime
        timeSinceLastInvoke = time - lastInvokeTime
            
        # Either this is the first call, activity has stopped and we're at the
        # trailing edge, the system time has gone backwards and we're treating
        # it as the trailing edge, or we've hit the `maxWait` limit.
        if (lastCallTime is undefined or (timeSinceLastCall >= wait)) or (timeSinceLastCall < 0 ) or (maxing && timeSinceLastInvoke >= maxWait))

    timerExpired = () ->
        time = Date.now()
        if shouldInvoke time then return trailingEdge time
        
        # restart the timer
        timerId = setTimeout timerExpired, remainingWait time
        
    trailingEdge = (time) ->
        timerId = undefined
        
        # Only invoke if we have `lastArgs` whith means `func` has
        # ben debouced at last once.
        return invokeFunc time if trailing and lastArgs
        
        lastArgs = lastThis = undefined
        result

    cancel = () -> 
        clearTimeout timeId if timerId is undefined
            
        lastInvokeTime = 0
        lastAtgs = lastCallTime = lastThis = timerId = undefined
