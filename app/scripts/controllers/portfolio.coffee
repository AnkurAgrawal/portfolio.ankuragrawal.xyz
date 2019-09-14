'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:PortfolioCtrl
 # @description
 # # PortfolioCtrl
 # Controller of the ankuragrawalApp
###
ankuragrawalApp
  .controller 'PortfolioCtrl', ($scope, $rootScope, projects, constants) ->
    $rootScope.landing = false
    $scope.projects = projects
    $scope.DEVELOPMENT = constants.DEVELOPMENT
