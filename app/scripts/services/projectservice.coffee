'use strict'

###*
 # @ngdoc service
 # @name ankuragrawalApp.projectService
 # @description
 # # projectService
 # Factory in the ankuragrawalApp.
###
ankuragrawalApp
  .factory 'projectService', ($firebaseArray, $firebaseObject, dbService) ->

    projectService = {}
    projectService.collectionName = 'projects'

    projectService.getProjectsList = ->
      dbService.query "#{this.collectionName}", $firebaseArray

    projectService.getProject = (projectSlug) ->
      dbService.query "#{this.collectionName}-details/#{projectSlug}", $firebaseObject

    projectService
