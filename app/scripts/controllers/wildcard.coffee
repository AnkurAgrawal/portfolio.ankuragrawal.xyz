'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:WildcardCtrl
 # @description
 # # WildcardCtrl
 # Controller of the ankuragrawalApp
###
angular.module 'ankuragrawalApp'
  .controller 'WildcardCtrl', (wildcardDefinition) ->
    @definition = wildcardDefinition
    return
