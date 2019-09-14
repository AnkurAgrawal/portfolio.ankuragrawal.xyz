'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:LeadershipCtrl
 # @description
 # # LeadershipCtrl
 # Controller of the ankuragrawalApp
###
ankuragrawalApp
  .controller 'LeadershipCtrl', ($scope, $rootScope, $routeParams, leadership) ->
    $rootScope.landing = false
    if leadership.title?
      $scope.leadership = leadership
      $scope.leadership.slug = $routeParams.leadershipSlug
