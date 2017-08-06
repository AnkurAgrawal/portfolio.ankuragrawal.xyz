'use strict'

describe 'Controller: a404Ctrl', ->

  # load the controller's module
  beforeEach module 'ankuragrawalApp'

  a404Ctrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    a404Ctrl = $controller 'a404Ctrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(a404Ctrl.awesomeThings.length).toBe 3
