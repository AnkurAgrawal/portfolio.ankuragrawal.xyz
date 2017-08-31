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
      scope.width = if attrs.width then attrs.width else '2160'
      scope.height = if attrs.height then attrs.height else '1440'
