'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:ProjectCtrl
 # @description
 # # ProjectCtrl
 # Controller of the ankuragrawalApp
###
ankuragrawalApp
  .controller 'ProjectCtrl', ($scope, $rootScope, $routeParams, project, $route) ->
    $rootScope.landing = false
    if project.title?
      $scope.project = project
      $scope.project.slug = $routeParams.projectSlug
