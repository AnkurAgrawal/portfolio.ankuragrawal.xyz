'use strict'

###*
 # @ngdoc filter
 # @name ankuragrawalApp.filter:youtubeEmbedUrl
 # @function
 # @description
 # # youtubeEmbedUrl
 # Filter in the ankuragrawalApp.
###
ankuragrawalApp
  .filter 'youtubeEmbedUrl', ($sce) ->
    (videoId) ->
      $sce.trustAsResourceUrl('http://www.youtube.com/embed/' + videoId)