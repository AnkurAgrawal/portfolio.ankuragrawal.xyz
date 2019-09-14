'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:ProjectCtrl
 # @description
 # # ProjectCtrl
 # Controller of the ankuragrawalApp
###
ankuragrawalApp
  .controller 'ProjectCtrl', ($scope, $rootScope, $routeParams, project, angularGridInstance, imageService) ->
    $rootScope.landing = false

    $scope.getCurrentProjectImageAssetUrl = (image) ->
      imageService.getImageAssetUrl() + 'projects/' + $scope.project.slug + '/' + image

    $scope.getCurrentProjectThumbnailImageAssetUrl = (image) ->
      imageService.getThumbnailImageAssetUrl() + 'projects/' + $scope.project.slug + '/' + image

    $scope.init = ->
      $rootScope.title = project.title + ': project ';
      # $.announce($rootScope.title + ' page loaded', 'assertive')
      _getImagesInProject('.project-details section.description')
      setTimeout ->
        $.cloudinary.responsive()
        $('#lightSlider').lightSlider
          gallery: true,
          item: 1,
          autoWidth: false,
          loop: true,
          slideMargin: 0,
          thumbItem: 12,
          adaptiveHeight: true,

          pager: true,

          enableTouch:true,
          enableDrag:true,
          freeMove:true,
          swipeThreshold: 40,

          keyPress: true
      , 100

    $scope.images = []

    _getImagesInProject = (containerSection) ->
      setTimeout ->
        $images = $(containerSection + ' img')
        if $images.length > 0
          $images.each (imgA) ->
            $img = $(this)
            w = parseInt($img.attr('data-width'), 10) || parseInt($img.attr('width'), 10)
            h = parseInt($img.attr('data-height'), 10) || parseInt($img.attr('height'), 10)

            img =
              src: $img.attr('data-src') || $img.attr('ng-data-src')
              w: if $scope.isRetina() then w/2 else w
              h: if $scope.isRetina() then h/2 else h
              title: $img.parents('figure').find('figcaption').text() || $img.attr('alt')
            $scope.images.push(img)
          _initPhotoSwipe(containerSection)
      , 100
      return

    _initPhotoSwipe = (containerSection) ->
      setTimeout ->
        pswpElement = document.querySelectorAll(".pswp")[0]
        items = angular.copy($scope.images)

        $(containerSection).on 'click', 'figure', (e) ->
          e.preventDefault()
          options =
            index: $(containerSection + ' figure').index(this)
            history: false
            closeOnScroll: false
            showHideOpacity: true
            bgOpacity: 0.8
            hideAnimationDuration: 500
            showAnimationDuration: 500
            getThumbBoundsFn: (index) ->
              thumbnail = document.querySelectorAll(containerSection + ' img')[index]
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
        jsonLink = angular.fromJson link
        jsonLink.type = 'external'
        $links.push jsonLink
        return
      angular.forEach project['internal-links'], (link) ->
        jsonLink = angular.fromJson link
        jsonLink.type = 'internal'
        $links.push jsonLink
        return

      $scope.project['links'] = $links
      $scope.init()
      return