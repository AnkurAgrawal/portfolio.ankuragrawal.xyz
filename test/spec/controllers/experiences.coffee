'use strict'

describe 'Controller: ExperiencesCtrl', ->

  # load the controller's module
  beforeEach module 'ankuragrawalApp'

  ExperiencesCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ExperiencesCtrl = $controller 'ExperiencesCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(ExperiencesCtrl.awesomeThings.length).toBe 3
