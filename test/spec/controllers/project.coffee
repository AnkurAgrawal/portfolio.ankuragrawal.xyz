'use strict'

describe 'Controller: ProjectCtrl', ->

  # load the controller's module
  beforeEach module 'ankuragrawalApp'

  ProjectCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ProjectCtrl = $controller 'ProjectCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(ProjectCtrl.awesomeThings.length).toBe 3
