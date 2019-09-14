'use strict'

###*
 # @ngdoc service
 # @name ankuragrawalApp.workService
 # @description
 # # workService
 # Factory in the ankuragrawalApp.
###
angular.module 'ankuragrawalApp'
  .factory 'workService', ($firebaseObject, dbService) ->

    workService = {}
    workService.collectionName = 'work'

    workService.getWorks = ->
      dbService.query this.collectionName, $firebaseObject

    workService.getWork = (workSlug) ->
      dbService.query this.collectionName + '/' + workSlug, $firebaseObject

    workService
