'use strict'

describe 'Controller: AppCtrl', ->

  # load the controller's module
  beforeEach module 'ankuragrawalApp'

  AppCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    AppCtrl = $controller 'AppCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(AppCtrl.awesomeThings.length).toBe 3
