expect = require 'expect.js'

eq = require '../src/eq'

describe 'eq method', ->
    beforeEach ->
        # ...
    it 'Shoud return true', ->
        result = eq 1, 1
        expect(true).to.eql(result)
