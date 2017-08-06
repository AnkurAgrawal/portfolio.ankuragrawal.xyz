'use strict'

ankuragrawalApp.config ($routeProvider, $locationProvider, $sceProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'views/landing.html'
      controller: 'LandingCtrl'
      controllerAs: 'landing'
      title: 'home - ankur agrawal, wildcard designer + technologist'
      bodyClass: 'landing'
    .when '/about',
      templateUrl: 'views/about.html'
      controller: 'AboutCtrl'
      controllerAs: 'about'
      title: 'about'
      bodyClass: 'about'
    .when '/portfolio',
      templateUrl: 'views/portfolio.html'
      controller: 'PortfolioCtrl'
      controllerAs: 'portfolio'
      title: 'portfolio'
      resolve:
        projects: (projectService) ->
          projectService.getProjectsList()
        sidebarQnA: (sidebarService) ->
          sidebarService.getQnA()
    .when '/portfolio/:projectSlug',
      templateUrl: 'views/project.html'
      controller: 'ProjectCtrl'
      controllerAs: 'project-details'
      title: 'project'
      resolve:
        project: (projectService, $route) ->
          projectService.getProject($route.current.params.projectSlug)
    .when '/contact',
      templateUrl: 'views/contact.html'
      controller: 'ContactCtrl'
      controllerAs: 'contact'
      title: 'contact'
    .otherwise
      templateUrl: "views/404.html"
      controller: "404Ctrl"

  $locationProvider
    .html5Mode true
    .hashPrefix '!'

  $sceProvider.enabled false
  return


ankuragrawalApp.run [
  '$location'
  '$rootScope'
  '$route'
  'ngProgressFactory'
  '$anchorScroll'
  '$templateCache'
  '$timeout'
  ($location, $rootScope, $route, ngProgressFactory, $anchorScroll, $templateCache, $timeout) ->
    history = undefined
    progressBar = ngProgressFactory.createInstance()
    progressBar.setColor '#76a7fa'

    $rootScope.$on "$routeChangeStart",  (event, next, current) ->
      rand = Math.floor Math.random() * 8
      $rootScope.rand = rand
      progressBar.start()
      $timeout ->
        $ '.tooltip'
          .hide()
      , 1

    $rootScope.$on '$routeChangeSuccess', (event, current, previous) ->
      $rootScope.title = $route.current.title;
      progressBar.complete()
      progressBar.stop()
      $anchorScroll()
      $ 'sticky-scroll'
      .scrollTop 0, 20
      $ '#main'
      .access true
      if $route.current.title
        $.announce $route.current.title + ' page loaded', 'assertive'
      if $route.current
        $rootScope.title = $route.current.title
        $rootScope.bodyClass = $route.current.bodyClass

    $rootScope.$on "$routeChangeError", (event, current, previous) ->
      progressBar.complete()
      progressBar.stop()

    $rootScope.$on '$viewContentLoaded', ->
      if history
        $ 'h1'
        .attr 'tabIndex', -1
        .focus()
      return
    return
]
