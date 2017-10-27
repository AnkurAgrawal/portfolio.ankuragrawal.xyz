'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:PublicationsCtrl
 # @description
 # # PublicationsCtrl
 # Controller of the ankuragrawalApp
###
angular.module 'ankuragrawalApp'
  .controller 'PatentAndPublicationCtrl', ($scope, $rootScope, $routeParams, patent_publication, imageService) ->
    $rootScope.landing = false
    if patent_publication.type is "publication"
      $scope.publication = patent_publication
      $scope.publication.slug = $routeParams.slug
    else if patent_publication.type is "patent"
      $scope.patent = patent_publication
      $scope.patent.slug = $routeParams.slug
    else
      $scope.patents_publications_list = patent_publication

    $scope.getPatentImageAssetUrl = (image) ->
      "#{imageService.getImageAssetUrl()}projects/patents-and-publications/#{image}"

    $scope.getPublicationImageAssetUrl = (image) ->
      "#{imageService.getImageAssetUrl()}projects/patents-and-publications/#{image}"
