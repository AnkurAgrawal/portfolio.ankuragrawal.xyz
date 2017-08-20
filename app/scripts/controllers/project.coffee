'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:ProjectCtrl
 # @description
 # # ProjectCtrl
 # Controller of the ankuragrawalApp
###
ankuragrawalApp
  .controller 'ProjectCtrl', ($scope, $rootScope, $routeParams, project) ->
    $rootScope.landing = false


    $scope.getCurrentProjectImageAssetUrl = (image) ->
      "#{this.getImageAssetUrl()}projects/#{$scope.project.slug}/#{image}"

    $scope.isRetina = ->
      ((window.matchMedia && (window.matchMedia('only screen and (min-resolution: 192dpi), only screen and (min-resolution: 2dppx), only screen and (min-resolution: 75.6dpcm)').matches || window.matchMedia('only screen and (-webkit-min-device-pixel-ratio: 2), only screen and (-o-min-device-pixel-ratio: 2/1), only screen and (min--moz-device-pixel-ratio: 2), only screen and (min-device-pixel-ratio: 2)').matches)) || (window.devicePixelRatio && window.devicePixelRatio >= 2)) && /(iPad|iPhone|iPod)/g.test(navigator.userAgent);

    $scope.init = ->
      $rootScope.title = "#{project.title}: project ";
      $.announce($rootScope.title + ' page loaded', 'assertive')
      _getImagesInProject()

    $scope.images = []

    _getImagesInProject = ->
      setTimeout ->
        $images = $('.project-details section.description img')
        if $images.length > 0
          $images.each (imgA) ->
            $img = $(this)
            w = parseInt($img.attr('data-width'), 10) || parseInt($img.attr('width'), 10)
            h = parseInt($img.attr('data-height'), 10) || parseInt($img.attr('height'), 10)

            img =
              src: $img.attr('src')
              w: if $scope.isRetina() then w/2 else w
              h: if $scope.isRetina() then h/2 else h
              title: $img.parents('figure').find('figcaption').text() || $img.attr('alt')
            $scope.images.push(img)
          _initPhotoSwipe()
      , 100
      return

    _initPhotoSwipe = ->
      setTimeout ->
        pswpElement = document.querySelectorAll(".pswp")[0]
        items = angular.copy($scope.images)

        $('.project-details section.description').on 'click', 'figure', (e) ->
          e.preventDefault()
          options =
            index: $('.project-details section.description figure').index(this)
            history: false
            closeOnScroll: false
            showHideOpacity: true
            bgOpacity: 0.8
            hideAnimationDuration: 500
            showAnimationDuration: 500
            getThumbBoundsFn: (index) ->
              thumbnail = document.querySelectorAll(".project-details section.description img")[index]
              pageYScroll = window.pageYOffset or document.documentElement.scrollTop
              rect = thumbnail.getBoundingClientRect()
              x: rect.left
              y: rect.top + pageYScroll
              w: rect.width

          gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, angular.copy(items), options)
          gallery.init()
      , 10

    if project.title?
      $scope.project = project
      $scope.project.slug = $routeParams.projectSlug

      $links = []
      angular.forEach project['external-links'], (link) ->
        $links.push angular.fromJson link
        return
      $scope.project['external-links'] = $links
      $scope.init()
      return