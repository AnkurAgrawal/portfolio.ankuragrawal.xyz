'use strict'

###*
 # @ngdoc service
 # @name ankuragrawalApp.AwardService
 # @description
 # # AwardService
 # Factory in the ankuragrawalApp.
###
ankuragrawalApp
  .factory 'awardService', ($firebaseObject, dbService) ->

    awardService = {}
    awardService.collectionName = 'honors-&-awards'

    awardService.getAward = (awardSlug) ->
      dbService.query "#{this.collectionName}/#{awardSlug}", $firebaseObject

    awardService
