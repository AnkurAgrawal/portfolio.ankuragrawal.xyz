'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:PublicationsCtrl
 # @description
 # # PublicationsCtrl
 # Controller of the ankuragrawalApp
###
angular.module 'ankuragrawalApp'
  .controller 'PublicationCtrl', ($scope, $rootScope, $routeParams, publication) ->
    $rootScope.landing = false
    if publication.title?
      $scope.publication = publication
      $scope.publication.slug = $routeParams.publicationSlug
