'use strict'

describe 'Controller: PublicationCtrl', ->

  # load the controller's module
  beforeEach module 'ankuragrawalApp'

  PublicationsCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    PublicationsCtrl = $controller 'PublicationsCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(PublicationsCtrl.awesomeThings.length).toBe 3
