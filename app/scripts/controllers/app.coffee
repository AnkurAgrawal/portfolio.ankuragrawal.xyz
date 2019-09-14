'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:AppCtrl
 # @description
 # # AppCtrl
 # Controller of the ankuragrawalApp
###
ankuragrawalApp
  .controller 'AppCtrl', ($scope, $rootScope, $location, ngProgressFactory, $timeout, $anchorScroll) ->
    $rootScope.landing = false

    $rootScope.colors = [
      {
        logo: ['#D35950', '#E46F61']
        border: '#D35950'
      }
      {
        logo: ['#5182BC', '#5D8FCA']
        border: '#5182BC'
      }
      {
        logo: ['#DBA628', '#EFBB37']
        border: '#DBA628'
      }
      {
        logo: ['#67AA48', '#84BC69']
        border: '#67AA48'
      }
      {
        logo: ['#AF456E', '#BC5679']
        border: '#AF456E'
      }
      {
        logo: ['#5069A3', '#6F85BF']
        border: '#5069A3'
      }
      {
        logo: ['#35A7BA', '#4DBFD9']
        border: '#35A7BA'
      }
      {
        logo: ['#773D99', '#8D50AA']
        border: '#773D99'
      }
    ]

    $scope.openLink = (path) ->
      $location.path(path)

    $scope.closeNavbarInMobile = (path) ->
      $scope.openLink(path)
      $timeout ->
        $('.title-bar button').click()
      , 10

    $rootScope.getClass = (paths) ->
      typeIsArray = Array.isArray || ( value ) -> return {}.toString.call( value ) is '[object Array]'
      paths = [paths] unless typeIsArray paths
      active = false
      angular.forEach paths, (path) ->
        if (path is '/' and $location.path() is path) or (path isnt '/' and $location.path().substr(0, path.length) is path) then active = true
      return 'active' unless active isnt true

    $scope.gotoTop = ->
      $location.hash('start-of-page')
      $anchorScroll()

    $scope.isRetina = ->
      ((window.matchMedia && (window.matchMedia('only screen and (min-resolution: 192dpi), only screen and (min-resolution: 2dppx), only screen and (min-resolution: 75.6dpcm)').matches || window.matchMedia('only screen and (-webkit-min-device-pixel-ratio: 2), only screen and (-o-min-device-pixel-ratio: 2/1), only screen and (min--moz-device-pixel-ratio: 2), only screen and (min-device-pixel-ratio: 2)').matches)) || (window.devicePixelRatio && window.devicePixelRatio >= 2)) && /(iPad|iPhone|iPod)/g.test(navigator.userAgent);
