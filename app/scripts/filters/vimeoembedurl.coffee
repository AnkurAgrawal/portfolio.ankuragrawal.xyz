'use strict'

###*
 # @ngdoc filter
 # @name ankuragrawalApp.filter:vimeoEmbedUrl
 # @function
 # @description
 # # vimeoEmbedUrl
 # Filter in the ankuragrawalApp.
###
ankuragrawalApp
  .filter 'vimeoEmbedUrl', ($sce) ->
    (videoId) ->
      $sce.trustAsResourceUrl('//vimeo.com/' + videoId)