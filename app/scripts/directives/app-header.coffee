'use strict'

###*
 # @ngdoc directive
 # @name ankuragrawalApp.directive:appHeader
 # @description
 # # appHeader
###
ankuragrawalApp
  .directive 'appHeader', ->
    replace: true
    restrict: 'EA'
    templateUrl: (iElement, iAttrs) ->
      if !iAttrs.src
        throw new Error("app-header: template url must be provided")
      iAttrs.src
