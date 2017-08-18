'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:AwardCtrl
 # @description
 # # AwardCtrl
 # Controller of the ankuragrawalApp
###
angular.module 'ankuragrawalApp'
  .controller 'AwardCtrl', ($scope, $rootScope, $routeParams, award) ->
    $rootScope.landing = false
    if award.title?
      $scope.award = award
      $scope.award.slug = $routeParams.awardSlug
