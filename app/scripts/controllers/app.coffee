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

    $scope.closeNavbarInMobile = (path) ->
      $location.path(path)
      $timeout ->
        if $('.top-bar').hasClass('expanded')
          $('.toggle-topbar').click()
      , 10


    $rootScope.getClass = (paths) ->
      typeIsArray = Array.isArray || ( value ) -> return {}.toString.call( value ) is '[object Array]'
      paths = [paths] unless typeIsArray paths
      active = false
      angular.forEach paths, (path) ->
        if (path is '/' and $location.path() is path) or (path isnt '/' and $location.path().substr(0, path.length) is path) then active = true
      return "active" unless active isnt true

    $scope.gotoTop = ->
      $location.hash('start-of-page')
      $anchorScroll()
