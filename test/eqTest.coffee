expect = require 'expect.js'


eq = require '../src/eq'


describe 'Eq method', ->
    beforeEach ->
        # ...
    it 'Shoud return true', ->
        result = eq 1, 1
        expect(true).to.eql(result)
