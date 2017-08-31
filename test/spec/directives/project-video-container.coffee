'use strict'

describe 'Directive: projectVideoContainer', ->

  # load the directive's module
  beforeEach module 'ankuragrawalApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<project-video-container></project-video-container>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the projectVideoContainer directive'
