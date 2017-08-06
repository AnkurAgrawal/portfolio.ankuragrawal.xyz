'use strict'

###*
 # @ngdoc service
 # @name ankuragrawalApp.constants
 # @description
 # # constants
 # Constant in the ankuragrawalApp.
###
angular.module 'ankuragrawalApp'
  .constant 'constants',
    # BASE_CDN_URL: 'http://assets.ankuragrawal.xyz/'
    BASE_CDN_URL: 'http://localhost:9000/'
    BASE_IMAGES_URL: "images/"
    flickrConfig:
      user_id: 'agrawal.ankur',
      api_key: '6219f562d9463cafc1650652df92c5eb'
