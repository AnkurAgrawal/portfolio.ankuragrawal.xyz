'use strict'

describe 'Controller: PortfolioCtrl', ->

  # load the controller's module
  beforeEach module 'ankuragrawalApp'

  PortfolioCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    PortfolioCtrl = $controller 'PortfolioCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(PortfolioCtrl.awesomeThings.length).toBe 3
