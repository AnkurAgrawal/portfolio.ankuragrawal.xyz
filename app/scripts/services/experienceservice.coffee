'use strict'

###*
 # @ngdoc service
 # @name ankuragrawalApp.experienceService
 # @description
 # # experienceService
 # Service in the ankuragrawalApp.
###
angular.module 'ankuragrawalApp'
  .service 'experienceService', ($firebaseObject, dbService) ->

    experienceService = {}

    experienceService.getExperiences = (experienceSlug) ->
      dbService.query experienceSlug, $firebaseObject

    experienceService
