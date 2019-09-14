'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:LeadershipsCtrl
 # @description
 # # LeadershipsCtrl
 # Controller of the ankuragrawalApp
###
ankuragrawalApp
  .controller 'LeadershipsCtrl', ($scope, $rootScope, $routeParams, leaderships) ->
    $rootScope.landing = false

    $scope.leaderships = leaderships
