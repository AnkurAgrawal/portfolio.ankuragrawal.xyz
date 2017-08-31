'use strict'

describe 'Filter: youtubeEmbedUrl', ->

  # load the filter's module
  beforeEach module 'ankuragrawalApp'

  # initialize a new instance of the filter before each test
  youtubeEmbedUrl = {}
  beforeEach inject ($filter) ->
    youtubeEmbedUrl = $filter 'youtubeEmbedUrl'

  it 'should return the input prefixed with "youtubeEmbedUrl filter:"', ->
    text = 'angularjs'
    expect(youtubeEmbedUrl text).toBe ('youtubeEmbedUrl filter: ' + text)
