'use strict'

describe 'Service: flickrConfig', ->

  # load the service's module
  beforeEach module 'ankuragrawalApp'

  # instantiate service
  flickrConfig = {}
  beforeEach inject (_flickrConfig_) ->
    flickrConfig = _flickrConfig_

  it 'should do something', ->
    expect(!!flickrConfig).toBe true
