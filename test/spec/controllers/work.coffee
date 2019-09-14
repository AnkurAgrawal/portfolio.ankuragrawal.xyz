'use strict'

describe 'Controller: WorkCtrl', ->

  # load the controller's module
  beforeEach module 'ankuragrawalApp'

  WorkCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    WorkCtrl = $controller 'WorkCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(WorkCtrl.awesomeThings.length).toBe 3
