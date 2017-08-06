'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:ContactCtrl
 # @description
 # # ContactCtrl
 # Controller of the ankuragrawalApp
###
ankuragrawalApp
  .controller 'ContactCtrl', ($scope, $rootScope, $route, $http, $window) ->
    $rootScope.landing = false
    $scope.contact = {}

    $scope.submitForm = (contact) ->
      console.log 'Message sent successfully'
      $http.post 'https://formspree.io/ankuragrawal@ymail.com', contact
      .then (response) ->
        if (response.data.success)
          $scope.contact = {};

          # display success message
          $scope.$parent.success = true;
      , (err) ->
        # display error message
        $scope.$parent.error = true;
