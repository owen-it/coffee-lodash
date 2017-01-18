expect = require 'expect.js'

isSymbol = require '../src/isSymbol'

describe 'isSymbol method', ->
    beforeEach ->
        # ...
        
    it 'Shoud return true', ->
        result = isSymbol Symbol.iterator
        expect(true).to.eql(result)
        
    it 'Shoud return false', ->
        result = isSymbol 'foo'
        expect(false).to.eql(result)
