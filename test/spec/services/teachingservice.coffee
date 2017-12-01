'use strict'

describe 'Service: teachingService', ->

  # load the service's module
  beforeEach module 'ankuragrawalApp'

  # instantiate service
  teachingService = {}
  beforeEach inject (_teachingService_) ->
    teachingService = _teachingService_

  it 'should do something', ->
    expect(!!teachingService).toBe true
