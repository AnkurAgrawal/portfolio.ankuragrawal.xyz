'use strict'

###*
 # @ngdoc directive
 # @name ankuragrawalApp.directive:projectImageContainer
 # @description
 # # projectImageContainer
###
ankuragrawalApp
  .directive 'projectImageContainer', ->
    replace: true
    restrict: 'EA'
    scope:
      src: '@'
      alt: '@'
      class: '@'
    templateUrl: (iElement, iAttrs) ->
      if !iAttrs.templateUrl
        iAttrs.templateUrl = "views/partials/_project_image_container.html"
      iAttrs.templateUrl
    link: (scope, element, attrs) ->
      scope.width = attrs.width ? attrs.width || '2160'
      scope.height = attrs.height ? attrs.height || '1440'
