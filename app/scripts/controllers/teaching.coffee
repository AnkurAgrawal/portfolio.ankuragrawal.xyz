'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:TeachingCtrl
 # @description
 # # TeachingCtrl
 # Controller of the ankuragrawalApp
###
angular.module 'ankuragrawalApp'
  .controller 'TeachingCtrl', ($scope, $rootScope, $routeParams, teachings) ->
    $rootScope.landing = false

    $scope.teachings = teachings
