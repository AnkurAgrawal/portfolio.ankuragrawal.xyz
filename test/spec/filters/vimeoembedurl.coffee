'use strict'

describe 'Filter: vimeoEmbedUrl', ->

  # load the filter's module
  beforeEach module 'ankuragrawalApp'

  # initialize a new instance of the filter before each test
  vimeoEmbedUrl = {}
  beforeEach inject ($filter) ->
    vimeoEmbedUrl = $filter 'vimeoEmbedUrl'

  it 'should return the input prefixed with "vimeoEmbedUrl filter:"', ->
    text = 'angularjs'
    expect(vimeoEmbedUrl text).toBe ('vimeoEmbedUrl filter: ' + text)
