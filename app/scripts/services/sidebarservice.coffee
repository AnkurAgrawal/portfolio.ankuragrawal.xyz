'use strict'

###*
 # @ngdoc service
 # @name ankuragrawalApp.sidebarService
 # @description
 # # sidebarService
 # Factory in the ankuragrawalApp.
###
ankuragrawalApp
  .factory 'sidebarService', ($firebaseObject, dbService) ->

    sidebarService = {}
    sidebarService.collectionName = 'portfolio-sidebar'

    sidebarService.getQnA = ->
      dbService.query this.collectionName, $firebaseObject

    sidebarService
