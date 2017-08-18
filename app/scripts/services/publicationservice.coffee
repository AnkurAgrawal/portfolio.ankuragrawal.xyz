'use strict'

###*
 # @ngdoc service
 # @name ankuragrawalApp.publicationService
 # @description
 # # publicationService
 # Factory in the ankuragrawalApp.
###
angular.module 'ankuragrawalApp'
  .factory 'publicationService', ($firebaseObject, dbService) ->

    publicationService = {}
    publicationService.collectionName = 'publications'

    publicationService.getPublication = (publicationSlug) ->
      dbService.query "#{this.collectionName}/#{publicationSlug}", $firebaseObject

    publicationService
