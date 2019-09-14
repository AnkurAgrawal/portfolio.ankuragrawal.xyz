'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:TeachingCtrl
 # @description
 # # TeachingCtrl
 # Controller of the ankuragrawalApp
###
ankuragrawalApp
  .controller 'TeachingCtrl', ($scope, $rootScope, $routeParams, teaching) ->
    $rootScope.landing = false
    if teaching.title?
      $scope.teaching = teaching
      $scope.teaching.slug = $routeParams.teachingSlug
