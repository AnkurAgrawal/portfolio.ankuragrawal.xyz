'use strict'

describe 'Service: sidebarService', ->

  # load the service's module
  beforeEach module 'ankuragrawalApp'

  # instantiate service
  sidebarService = {}
  beforeEach inject (_sidebarService_) ->
    sidebarService = _sidebarService_

  it 'should do something', ->
    expect(!!sidebarService).toBe true
