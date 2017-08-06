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
      "background-image": "url(#{constants.BASE_CDN_URL}#{constants.BASE_IMAGES_URL}projects/#{projectSlug}/thumb.svg)"
