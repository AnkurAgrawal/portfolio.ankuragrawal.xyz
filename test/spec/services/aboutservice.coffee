'use strict'

describe 'Service: aboutService', ->

  # load the service's module
  beforeEach module 'ankuragrawalApp'

  # instantiate service
  aboutService = {}
  beforeEach inject (_aboutService_) ->
    aboutService = _aboutService_

  it 'should do something', ->
    expect(!!aboutService).toBe true
