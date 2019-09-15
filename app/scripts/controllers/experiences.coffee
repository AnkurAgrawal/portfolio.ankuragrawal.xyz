'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:ExperiencesCtrl
 # @description
 # # ExperiencesCtrl
 # Controller of the ankuragrawalApp
###
ankuragrawalApp
  .controller 'ExperiencesCtrl', ($scope, $rootScope, $routeParams, experiences) ->
    $rootScope.landing = false

    $rootScope.title = $routeParams.experienceSlug + ': experiences';

    $scope.experiences = experiences
    $scope.experiences.slug = $routeParams.experienceSlug
