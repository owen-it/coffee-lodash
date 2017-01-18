expect = require 'expect.js'

isObjectLike = require '../src/isObjectLike'

describe 'isObjectLike method', ->
    beforeEach ->
        # ...
        
    it 'Shoud return true', ->
        result = isObjectLike {}
        expect(true).to.eql(result)
        
    it 'Shoud return true', ->
        result = isObjectLike [1, 2, 3]
        expect(true).to.eql(result)
        
    it 'Shoud return false', ->
        result = isObjectLike Function
        expect(false).to.eql(result)
        
    it 'Shoud return false', ->
        result = isObjectLike null
        expect(false).to.eql(result)
