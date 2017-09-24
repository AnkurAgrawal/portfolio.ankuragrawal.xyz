'use strict'

describe 'Filter: replaceCharacters', ->

  # load the filter's module
  beforeEach module 'ankuragrawalApp'

  # initialize a new instance of the filter before each test
  replaceCharacters = {}
  beforeEach inject ($filter) ->
    replaceCharacters = $filter 'replaceCharacters'

  it 'should return the input prefixed with "replaceCharacters filter:"', ->
    text = 'angularjs'
    expect(replaceCharacters text).toBe ('replaceCharacters filter: ' + text)
