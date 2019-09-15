'use strict'

###*
 # @ngdoc filter
 # @name ankuragrawalApp.filter:titlecase
 # @function
 # @description
 # # titlecase
 # Filter in the ankuragrawalApp.
###
angular.module 'ankuragrawalApp'
  .filter 'titlecase', ->
    (input) ->
      input.replace /\w\S*/g, (txt) -> # see comment below
        txt[0].toUpperCase() + txt[1..txt.length - 1].toLowerCase()

