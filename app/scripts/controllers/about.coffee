'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the ankuragrawalApp
###
ankuragrawalApp
  .controller 'AboutCtrl', ($scope, $rootScope, about, constants) ->
    $rootScope.landing = false

    $scope.toVars =
      left: 0

    $scope.about = about

    $scope.profileThumb = ->
      "background-image": "url(#{this.getImageAssetUrl()}about/profile.jpg)"
