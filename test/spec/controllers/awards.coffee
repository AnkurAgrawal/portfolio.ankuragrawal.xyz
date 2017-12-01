'use strict'

describe 'Controller: AwardsCtrl', ->

  # load the controller's module
  beforeEach module 'ankuragrawalApp'

  AwardsCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    AwardsCtrl = $controller 'AwardsCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(AwardsCtrl.awesomeThings.length).toBe 3
