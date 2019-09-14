'use strict'

###*
 # @ngdoc service
 # @name ankuragrawalApp.wildcardService
 # @description
 # # wildcardService
 # Factory in the ankuragrawalApp.
###
ankuragrawalApp
  .factory 'wildcardService', ($firebaseObject, dbService) ->

    wildcardService = {}
    wildcardService.collectionName = 'about/intro'

    wildcardService.getData = ->
      dbService.query this.collectionName, $firebaseObject

    wildcardService
