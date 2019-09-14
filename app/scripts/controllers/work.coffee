'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:WorkCtrl
 # @description
 # # WorkCtrl
 # Controller of the ankuragrawalApp
###
angular.module 'ankuragrawalApp'
  .controller 'WorkCtrl', ($scope, $rootScope, $routeParams, works) ->
    $rootScope.landing = false

    $scope.works = works
