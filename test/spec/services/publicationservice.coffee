'use strict'

describe 'Service: publicationService', ->

  # load the service's module
  beforeEach module 'ankuragrawalApp'

  # instantiate service
  publicationService = {}
  beforeEach inject (_publicationService_) ->
    publicationService = _publicationService_

  it 'should do something', ->
    expect(!!publicationService).toBe true
