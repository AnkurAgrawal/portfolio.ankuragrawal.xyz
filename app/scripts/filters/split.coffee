'use strict'

###*
 # @ngdoc filter
 # @name ankuragrawalApp.filter:split
 # @function
 # @description
 # # split
 # Filter in the ankuragrawalApp.
###
ankuragrawalApp
  .filter 'split', ->
    (input, splitChar) ->
      input.split splitChar
