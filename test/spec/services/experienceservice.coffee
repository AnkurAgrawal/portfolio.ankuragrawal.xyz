'use strict'

describe 'Service: experienceService', ->

  # load the service's module
  beforeEach module 'ankuragrawalApp'

  # instantiate service
  experienceService = {}
  beforeEach inject (_experienceService_) ->
    experienceService = _experienceService_

  it 'should do something', ->
    expect(!!experienceService).toBe true
