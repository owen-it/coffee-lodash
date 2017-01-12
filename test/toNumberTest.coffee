expect = require 'expect.js'

toNumber = require '../src/toNumber'

describe 'toNumber method', ->
    beforeEach ->
        # ...
    it 'Shoud return 3.2', ->
        number = toNumber 3.2
        expect(3.2).to.eql(number)
    it 'Shoud return 5e-324', ->
        number = toNumber Number.MIN_VALUE
        expect(5e-324).to.eql(number)
    it 'Shoud return 3.2', ->
        number = toNumber '3.2'
        expect(3.2).to.eql(number)
    it 'Shoud return 5', ->
        number = toNumber ' 5 '
        expect(5).to.eql(number)
