'use strict'

describe 'Service: awardService', ->

  # load the service's module
  beforeEach module 'ankuragrawalApp'

  # instantiate service
  awardService = {}
  beforeEach inject (_awardService_) ->
    awardService = _awardService_

  it 'should do something', ->
    expect(!!awardService).toBe true
