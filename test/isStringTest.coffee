expect = require 'expect.js'

isString = require '../src/isString'

describe 'isString method', ->
    beforeEach ->
        # ...
        
    it 'Shoud return true', ->
        result = isString 'abc'
        expect(true).to.eql(result)
        
    it 'Shoud return false', ->
        result = isString 1
        expect(false).to.eql(result)
