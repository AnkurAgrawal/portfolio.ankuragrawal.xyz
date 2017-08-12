'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:PortfolioCtrl
 # @description
 # # PortfolioCtrl
 # Controller of the ankuragrawalApp
###
ankuragrawalApp
  .controller 'PortfolioCtrl', ($scope, $rootScope, projects, sidebarQnA, constants) ->
    $rootScope.landing = false
    $scope.projects = projects

    $scope.question = sidebarQnA.question
    $scope.answer = sidebarQnA.answer

    $scope.projectThumb = (projectSlug) ->
      "background-image": "url(#{this.getImageAssetUrl()}projects/#{projectSlug}/thumb.svg)"
