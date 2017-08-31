'use strict'

###*
 # @ngdoc overview
 # @name ankuragrawalApp
 # @description
 # # ankuragrawalApp
 #
 # Main module of the application.
###
@ankuragrawalApp = angular
  .module 'ankuragrawalApp', [
    'ngAnimate'
    'ngAria'
    'ngResource'
    'ngRoute'
    'ngSanitize'
    'ngProgress'
    'ngTouch'
    'angulartics'
  	'angulartics.google.analytics'
    '720kb.tooltips'
    'firebase'
    'sticky'
    'duScroll'
    'flickr'
    'hj.scrollMagic'
    'angular-bind-html-compile'
    'videosharing-embed'
  ]
