'use strict'

describe 'Service: workService', ->

  # load the service's module
  beforeEach module 'ankuragrawalApp'

  # instantiate service
  workService = {}
  beforeEach inject (_workService_) ->
    workService = _workService_

  it 'should do something', ->
    expect(!!workService).toBe true
