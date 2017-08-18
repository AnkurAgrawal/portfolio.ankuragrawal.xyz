'use strict'

describe 'Service: wildcardService', ->

  # load the service's module
  beforeEach module 'ankuragrawalApp'

  # instantiate service
  wildcardService = {}
  beforeEach inject (_wildcardService_) ->
    wildcardService = _wildcardService_

  it 'should do something', ->
    expect(!!wildcardService).toBe true
