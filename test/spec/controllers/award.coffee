'use strict'

describe 'Controller: AwardCtrl', ->

  # load the controller's module
  beforeEach module 'ankuragrawalApp'

  AwardCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    AwardCtrl = $controller 'AwardCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(AwardCtrl.awesomeThings.length).toBe 3
