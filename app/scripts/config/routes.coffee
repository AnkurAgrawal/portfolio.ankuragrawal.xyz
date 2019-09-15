'use strict'

ankuragrawalApp.config ($routeProvider, $locationProvider, $sceProvider, scrollMagicProvider) ->
  $routeProvider
    .when '/',
      redirectTo: '/portfolio'
      # templateUrl: 'views/landing.html'
      # controller: 'LandingCtrl'
      # controllerAs: 'landing'
      # title: 'home - ankur agrawal, wildcard designer + technologist'
      # bodyClass: 'landing'
    .when '/about',
      templateUrl: 'views/about.html'
      controller: 'AboutCtrl'
      controllerAs: 'about-me'
      title: 'about'
      bodyClass: 'about'
      resolve:
        about: (aboutService) ->
          aboutService.getData()
    .when '/about/wildcard',
      templateUrl: 'views/wildcard.html'
      controller: 'WildcardCtrl'
      controllerAs: 'wildcard'
      title: 'wildcard'
      bodyClass: 'wildcard'
      resolve:
        wildcardDefinition: (wildcardService) ->
          wildcardService.getData()
    .when '/about/experience/:experienceSlug',
      templateUrl: 'views/experiences.html'
      controller: 'ExperiencesCtrl'
      controllerAs: 'experience'
      title: 'experience'
      resolve:
        experiences: (experienceService, $route) ->
          experienceService.getExperiences($route.current.params.experienceSlug)
    .when '/about/work/:workSlug',
      templateUrl: 'views/work-details.html'
      controller: 'WorkDetailsCtrl'
      controllerAs: 'work-details'
      title: 'work'
      resolve:
        work: (workService, $route) ->
          workService.getWork($route.current.params.workSlug)
    .when '/about/teaching/:teachingSlug',
      templateUrl: 'views/teaching.html'
      controller: 'TeachingCtrl'
      controllerAs: 'teaching-details'
      title: 'teaching'
      resolve:
        teaching: (teachingService, $route) ->
          teachingService.getTeaching($route.current.params.teachingSlug)
    .when '/about/leadership/:leadershipSlug',
      templateUrl: 'views/leadership.html'
      controller: 'LeadershipCtrl'
      controllerAs: 'leadership-details'
      title: 'leadership'
      resolve:
        leadership: (leadershipService, $route) ->
          leadershipService.getLeadership($route.current.params.leadershipSlug)
    .when '/about/awards/:awardSlug',
      templateUrl: 'views/award.html'
      controller: 'AwardCtrl'
      controllerAs: 'award-details'
      title: 'award'
      resolve:
        award: (awardService, $route) ->
          awardService.getAward($route.current.params.awardSlug)
    .when '/portfolio',
      templateUrl: 'views/portfolio.html'
      controller: 'PortfolioCtrl'
      controllerAs: 'portfolio'
      title: 'portfolio'
      resolve:
        projects: (projectService) ->
          projectService.getProjectsList()
    .when '/portfolio/patents-and-publications',
      templateUrl: 'views/patents-and-publications.html'
      controller: 'PatentAndPublicationCtrl'
      controllerAs: 'patents-and-publications'
      title: 'patents and publications'
      resolve:
        patent_publication: (patentAndPublicationService, $route) ->
          patentAndPublicationService.getPatentsPublicationsList()
    .when '/portfolio/patents-and-publications/:slug',
      templateUrl: 'views/patent-and-publication.html'
      controller: 'PatentAndPublicationCtrl'
      controllerAs: 'patent-and-publication-details'
      title: 'patent and publication'
      resolve:
        patent_publication: (patentAndPublicationService, $route) ->
          patentAndPublicationService.getPatentPublication($route.current.params.slug)
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
      templateUrl: 'views/404.html'
      controller: '404Ctrl'

  $locationProvider
    .html5Mode true
    .hashPrefix '!'

  $sceProvider.enabled false

  # scrollMagicProvider.addIndicators = true
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

    $rootScope.$on '$routeChangeStart',  (event, next, current) ->
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

    $rootScope.$on '$routeChangeError', (event, current, previous) ->
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
