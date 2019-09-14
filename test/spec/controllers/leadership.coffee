'use strict'

describe 'Controller: LeadershipCtrl', ->

  # load the controller's module
  beforeEach module 'ankuragrawalApp'

  LeadershipCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    LeadershipCtrl = $controller 'LeadershipCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(LeadershipCtrl.awesomeThings.length).toBe 3
