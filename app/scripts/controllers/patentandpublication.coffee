'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:PublicationsCtrl
 # @description
 # # PublicationsCtrl
 # Controller of the ankuragrawalApp
###
ankuragrawalApp
  .controller 'PatentAndPublicationCtrl', ($scope, $rootScope, $routeParams, patent_publication, imageService) ->
    $rootScope.landing = false

    $scope.getPatentImageAssetUrl = (image) ->
      imageService.getImageAssetUrl() + 'projects/patents-and-publications/' + image

    $scope.getPublicationImageAssetUrl = (image) ->
      imageService.getImageAssetUrl() + 'projects/patents-and-publications/' + image

    setTimeout ->
      $.cloudinary.responsive()
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
      , 5
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

    if patent_publication.type is 'publication'
      $scope.publication = patent_publication
      $scope.publication.slug = $routeParams.slug
      _getImagesInProject('.publication-details section.picture-gallery')
    else if patent_publication.type is 'patent'
      $scope.patent = patent_publication
      $scope.patent.slug = $routeParams.slug
      _getImagesInProject('.patent-details section.picture-gallery')
    else
      $scope.patents_publications_list = patent_publication
