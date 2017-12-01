'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:AwardsCtrl
 # @description
 # # AwardsCtrl
 # Controller of the ankuragrawalApp
###
ankuragrawalApp
  .controller 'AwardsCtrl', ($scope, $rootScope, $routeParams, awards) ->
    $rootScope.landing = false

    $scope.awards = awards
