expect = require 'expect.js'


head = require '../src/head'


describe 'Head method', ->
    beforeEach ->
        # ...
    it 'Shoud return 5', ->
        number = head [5, 6, 7]
        expect(5).to.eql(number)
    it 'Shoud return 109', ->
        number = head [109, 200, 254]
        expect(109).to.eql(number)
    it 'Shoud return undefined', ->
        number = head []
        expect(undefined).to.eql(number)
