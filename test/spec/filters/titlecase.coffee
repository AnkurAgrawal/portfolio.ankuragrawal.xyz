'use strict'

describe 'Filter: titlecase', ->

  # load the filter's module
  beforeEach module 'ankuragrawalApp'

  # initialize a new instance of the filter before each test
  titlecase = {}
  beforeEach inject ($filter) ->
    titlecase = $filter 'titlecase'

  it 'should return the input prefixed with "titlecase filter:"', ->
    text = 'angularjs'
    expect(titlecase text).toBe ('titlecase filter: ' + text)
