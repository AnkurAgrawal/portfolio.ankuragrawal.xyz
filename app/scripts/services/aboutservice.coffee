'use strict'

###*
 # @ngdoc service
 # @name ankuragrawalApp.aboutService
 # @description
 # # aboutService
 # Factory in the ankuragrawalApp.
###
ankuragrawalApp
  .factory 'aboutService', ($firebaseArray, $firebaseObject, dbService) ->

    aboutService = {}
    aboutService.collectionName = 'about'

    aboutService.getData = ->
      dbService.query "#{this.collectionName}", $firebaseObject

    aboutService
