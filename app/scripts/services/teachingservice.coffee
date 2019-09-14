'use strict'

###*
 # @ngdoc service
 # @name ankuragrawalApp.teachingService
 # @description
 # # teachingService
 # Factory in the ankuragrawalApp.
###
angular.module 'ankuragrawalApp'
  .factory 'teachingService', ($firebaseObject, dbService) ->

    teachingService = {}
    teachingService.collectionName = 'teachings'

    teachingService.getTeachings = ->
      dbService.query this.collectionName, $firebaseObject

    teachingService.getTeaching = (teachingSlug) ->
      dbService.query this.collectionName + '/' + teachingSlug, $firebaseObject

    teachingService
