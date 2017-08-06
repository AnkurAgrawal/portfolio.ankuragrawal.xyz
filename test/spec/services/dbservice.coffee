'use strict'

describe 'Service: dbService', ->

  # load the service's module
  beforeEach module 'ankuragrawalApp'

  # instantiate service
  dbService = {}
  beforeEach inject (_dbService_) ->
    dbService = _dbService_

  it 'should do something', ->
    expect(!!dbService).toBe true
