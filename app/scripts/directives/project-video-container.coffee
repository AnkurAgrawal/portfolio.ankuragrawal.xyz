'use strict'

###*
 # @ngdoc directive
 # @name ankuragrawalApp.directive:projectVideoContainer
 # @description
 # # projectVideoContainer
###
ankuragrawalApp
  .directive 'projectVideoContainer', ->
    replace: true
    restrict: 'EA'
    scope:
      src: '@'
      caption: '@'
      class: '@'
      poster: '@'
    templateUrl: (iElement, iAttrs) ->
      if !iAttrs.templateUrl
        iAttrs.templateUrl = "views/partials/_project_video_container.html"
      iAttrs.templateUrl
    link: (scope, element, attrs) ->
      console.log attrs
      scope.youtube = 'true' if attrs.youtube is ''
      scope.vimeo = 'true' if attrs.vimeo is ''
      scope.mp4 = 'true' if attrs.mp4 is ''
      scope.webm = 'true' if attrs.webm is ''
      scope.showDownload = 'true' if attrs.showDownload is ''
      scope.width = if attrs.width then attrs.width else '2160'
      scope.height = if attrs.height then attrs.height else '1440'
      console.log scope