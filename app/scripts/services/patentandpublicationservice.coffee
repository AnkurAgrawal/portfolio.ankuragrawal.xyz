'use strict'

###*
 # @ngdoc service
 # @name ankuragrawalApp.patentAndPublicationService
 # @description
 # # patentAndPublicationService
 # Factory in the ankuragrawalApp.
###
angular.module 'ankuragrawalApp'
  .factory 'patentAndPublicationService', ($firebaseObject, dbService) ->

    patentAndPublicationService = {}
    patentAndPublicationService.collectionName = 'patents-and-publications'

    patentAndPublicationService.getPatentPublication = (slug) ->
      dbService.query "#{this.collectionName}/#{slug}", $firebaseObject

    patentAndPublicationService.getPatentsPublicationsList = ->
      dbService.query "#{this.collectionName}", $firebaseObject

    patentAndPublicationService
