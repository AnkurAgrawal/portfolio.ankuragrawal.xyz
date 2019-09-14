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
    # BASE_CDN_URL: 'https://assets.ankuragrawal.xyz/'
    # BASE_HD_CDN_URL: 'http://localhost:9000/'
    BASE_HD_CDN_URL: 'https://res.cloudinary.com/ankuragrawal/image/upload/f_auto,q_auto,w_auto,c_scale/portfolio/'
    BASE_THUMBNAIL_CDN_URL: 'https://res.cloudinary.com/ankuragrawal/image/upload/t_media_lib_thumb/f_auto,q_auto,w_auto,c_scale/portfolio/'
    BASE_IMAGES_URL: 'images/'
    DEVELOPMENT: true
