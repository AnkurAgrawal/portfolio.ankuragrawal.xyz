'use strict'

###*
 # @ngdoc service
 # @name ankuragrawalApp.dbService
 # @description
 # # dbService
 # Factory in the ankuragrawalApp.
###
ankuragrawalApp
  .factory 'dbService', ($q) ->

    dbService = {}

    dbService.getDB = ->
      firebase.database()

    dbService.query = (collectionName, $wrapper) ->
      deferred = $q.defer()
      # $http.jsonp constants.base_api_url + 'projects'
      # .then (response) ->
      #   deferred.resolve response.data
      $wrapper this.getDB().ref "/#{collectionName}"
      .$loaded()
      .then (data) ->
        deferred.resolve data
      , (err) ->
        # fail safe
        $http.get "/data/#{collectionName}.json"
        .success (result) ->
          deferred.resolve result

      return deferred.promise

    dbService
