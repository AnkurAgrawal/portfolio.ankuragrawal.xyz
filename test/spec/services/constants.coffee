'use strict'

describe 'Service: constants', ->

  # load the service's module
  beforeEach module 'ankuragrawalApp'

  # instantiate service
  constants = {}
  beforeEach inject (_constants_) ->
    constants = _constants_

  it 'should do something', ->
    expect(!!constants).toBe true
