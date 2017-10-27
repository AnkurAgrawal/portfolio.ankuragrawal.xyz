'use strict'

describe 'Service: imageService', ->

  # load the service's module
  beforeEach module 'ankuragrawalApp'

  # instantiate service
  imageService = {}
  beforeEach inject (_imageService_) ->
    imageService = _imageService_

  it 'should do something', ->
    expect(!!imageService).toBe true
