expect = require 'expect.js'


first = require '../src/first'


describe 'First method', ->
    beforeEach ->
        # ...
    it 'Shoud return 6', ->
        number = first [6, 7, 8]
        expect(6).to.eql(number)
    it 'Shoud return 200', ->
        number = first [200, 254, 451]
        expect(200).to.eql(number)
