'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:WorkdetailsCtrl
 # @description
 # # WorkdetailsCtrl
 # Controller of the ankuragrawalApp
###
ankuragrawalApp
  .controller 'WorkDetailsCtrl', ($scope, $rootScope, $routeParams, work) ->
    $rootScope.landing = false
    if work.title?
      $scope.work = work
      $scope.work.slug = $routeParams.workSlug
