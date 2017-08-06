'use strict'

describe 'Service: projectService', ->

  # load the service's module
  beforeEach module 'ankuragrawalApp'

  # instantiate service
  projectService = {}
  beforeEach inject (_projectService_) ->
    projectService = _projectService_

  it 'should do something', ->
    expect(!!projectService).toBe true
