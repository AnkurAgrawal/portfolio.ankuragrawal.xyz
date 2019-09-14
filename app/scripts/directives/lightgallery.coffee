'use strict'

###*
 # @ngdoc directive
 # @name ankuragrawalApp.directive:lightgallery
 # @description
 # # lightgallery
###
ankuragrawalApp
  .directive 'lightgallery', ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      if  scope.$last
        element.parent().lightSlider
          gallery: true,
          item: 1,
          autoWidth: false,
          loop: true,
          slideMargin: 0,
          thumbItem: 12,

          pager: true,
          keypress: true,

          enableTouch:true,
          enableDrag:true,
          freeMove:true,
          swipeThreshold: 40,