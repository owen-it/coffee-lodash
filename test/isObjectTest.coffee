expect = require 'expect.js'

isObject = require '../src/isObject'

describe 'isObject method', ->
    beforeEach ->
        # ...
        
    it 'Shoud return true', ->
        result = isObject {}
        expect(true).to.eql(result)
        
    it 'Shoud return true', ->
        result = isObject [1, 2, 3]
        expect(true).to.eql(result)
        
    it 'Shoud return false', ->
        result = isObject null
        expect(false).to.eql(result)
        
    it 'Shoud return false', ->
        result = isObject 'foo'
        expect(false).to.eql(result)
