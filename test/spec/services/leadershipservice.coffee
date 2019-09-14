'use strict'

describe 'Service: leadershipService', ->

  # load the service's module
  beforeEach module 'ankuragrawalApp'

  # instantiate service
  leadershipService = {}
  beforeEach inject (_leadershipService_) ->
    leadershipService = _leadershipService_

  it 'should do something', ->
    expect(!!leadershipService).toBe true
