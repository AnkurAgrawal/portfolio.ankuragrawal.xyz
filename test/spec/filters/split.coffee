'use strict'

describe 'Filter: split', ->

  # load the filter's module
  beforeEach module 'ankuragrawalApp'

  # initialize a new instance of the filter before each test
  split = {}
  beforeEach inject ($filter) ->
    split = $filter 'split'

  it 'should return the input prefixed with "split filter:"', ->
    text = 'angularjs'
    expect(split text).toBe ('split filter: ' + text)
