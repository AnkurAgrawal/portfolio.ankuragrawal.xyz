'use strict'

describe 'Controller: ContactCtrl', ->

  # load the controller's module
  beforeEach module 'ankuragrawalApp'

  ContactCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ContactCtrl = $controller 'ContactCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(ContactCtrl.awesomeThings.length).toBe 3
