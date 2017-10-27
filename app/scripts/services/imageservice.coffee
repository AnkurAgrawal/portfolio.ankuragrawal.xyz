'use strict'

###*
 # @ngdoc service
 # @name ankuragrawalApp.imageService
 # @description
 # # imageService
 # Factory in the ankuragrawalApp.
###
ankuragrawalApp
  .factory 'imageService', (constants, $http, $templateCache) ->

    imageService = {}

    imageService.getImageAssetUrl = () ->
      "#{constants.BASE_CDN_URL}#{constants.BASE_IMAGES_URL}"

    imageService.getImagesFromFlickr = () ->
        $http {method: "GET", url: "https://api.flickr.com/services/feeds/photos_public.gne?format=json", cache: $templateCache}

    imageService
