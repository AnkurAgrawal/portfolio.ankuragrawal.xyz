'use strict'

describe 'Controller: WorkdetailsCtrl', ->

  # load the controller's module
  beforeEach module 'ankuragrawalApp'

  WorkdetailsCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    WorkdetailsCtrl = $controller 'WorkdetailsCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(WorkdetailsCtrl.awesomeThings.length).toBe 3
