'use strict'

###*
 # @ngdoc filter
 # @name ankuragrawalApp.filter:replaceCharacters
 # @function
 # @description
 # # replaceCharacters
 # Filter in the ankuragrawalApp.
###
angular.module 'ankuragrawalApp'
  .filter 'replaceCharacters', ->
    (input, find, replace) ->
      input.replace(new RegExp(find, 'g'), replace)
