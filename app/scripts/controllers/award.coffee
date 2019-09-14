'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:AwardCtrl
 # @description
 # # AwardCtrl
 # Controller of the ankuragrawalApp
###
ankuragrawalApp
  .controller 'AwardCtrl', ($scope, $rootScope, $routeParams, award) ->
    $rootScope.landing = false
    if award.title?
      $scope.award = award
      $scope.award.slug = $routeParams.awardSlug
