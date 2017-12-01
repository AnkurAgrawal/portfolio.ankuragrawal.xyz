'use strict'

describe 'Controller: TeachingCtrl', ->

  # load the controller's module
  beforeEach module 'ankuragrawalApp'

  TeachingCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TeachingCtrl = $controller 'TeachingCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(TeachingCtrl.awesomeThings.length).toBe 3
