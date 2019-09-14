'use strict'

describe 'Directive: lightgallery', ->

  # load the directive's module
  beforeEach module 'ankuragrawalApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<lightgallery></lightgallery>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the lightgallery directive'
