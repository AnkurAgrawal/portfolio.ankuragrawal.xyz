'use strict'

describe 'Controller: WildcardCtrl', ->

  # load the controller's module
  beforeEach module 'ankuragrawalApp'

  WildcardCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    WildcardCtrl = $controller 'WildcardCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(WildcardCtrl.awesomeThings.length).toBe 3
