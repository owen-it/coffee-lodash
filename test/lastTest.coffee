expect = require 'expect.js'


last = require '../src/last'


describe 'Last method', ->
    beforeEach ->
        # ...
    it 'Shoud return 7', ->
        number = last [5, 6, 7]
        expect(7).to.eql(number)
    it 'Shoud return 254', ->
        number = last [109, 200, 254]
        expect(254).to.eql(number)
    it 'Shoud return undefined', ->
        number = first []
        expect(undefined).to.eql(number)