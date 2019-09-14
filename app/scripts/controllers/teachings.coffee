'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:TeachingsCtrl
 # @description
 # # TeachingsCtrl
 # Controller of the ankuragrawalApp
###
ankuragrawalApp
  .controller 'TeachingsCtrl', ($scope, $rootScope, $routeParams, teachings) ->
    $rootScope.landing = false

    $scope.teachings = teachings
