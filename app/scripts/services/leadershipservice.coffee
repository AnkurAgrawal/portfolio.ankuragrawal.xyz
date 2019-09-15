'use strict'

###*
 # @ngdoc service
 # @name ankuragrawalApp.leadershipService
 # @description
 # # leadershipService
 # Factory in the ankuragrawalApp.
###
angular.module 'ankuragrawalApp'
  .factory 'leadershipService', ($firebaseObject, dbService) ->

    leadershipService = {}
    leadershipService.collectionName = 'leadership'

    leadershipService.getLeaderships = ->
      dbService.query this.collectionName, $firebaseObject

    leadershipService.getLeadership = (leadershipSlug) ->
      dbService.query this.collectionName + '/' + leadershipSlug, $firebaseObject

    leadershipService
