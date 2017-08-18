'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the ankuragrawalApp
###
ankuragrawalApp
  .controller 'AboutCtrl', ($scope, $rootScope, about) ->
    $rootScope.landing = false

    $scope.toVars =
      left: 0

    $scope.about = about

    $scope.profileThumb = ->
      "#{this.getImageAssetUrl()}about/profile1.jpg"
