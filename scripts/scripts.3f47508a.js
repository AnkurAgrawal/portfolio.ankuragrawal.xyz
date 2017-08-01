(function(){"use strict";this.ankuragrawalApp=angular.module("ankuragrawalApp",["ngAnimate","ngAria","ngResource","ngRoute","templates","ngSanitize","ngProgress","ngTouch","angulartics","angulartics.google.analytics","720kb.tooltips","firebase","sticky","duScroll"]),ankuragrawalApp.run(["$location","$rootScope","$route","ngProgressFactory","$anchorScroll","$templateCache","$timeout",function(a,b,c,d,e,f,g){var h,i,j;i=void 0,h=void 0,j=d.createInstance(),j.setColor("#76a7fa"),b.$on("$routeChangeStart",function(a,c,d){var e;return e=Math.floor(8*Math.random()),b.rand=e,j.start(),g(function(){return $(".tooltip").hide()},1)}),b.$on("$routeChangeError",function(a,b,c){return j.complete(),j.stop()}),b.$on("$routeChangeSuccess",function(a,d,f){return b.title=c.current.title,j.complete(),j.stop(),e(),$("sticky-scroll").scrollTop(0,20),$("#main").access(!0),c.current.title&&$.announce(c.current.title+" page loaded","assertive"),c.current?(b.title=c.current.title,b.bodyClass=c.current.bodyClass):void 0}),b.$on("$routeChangeError",function(a,b,c){return j.complete(),j.stop()}),b.$on("$viewContentLoaded",function(){i&&$("h1").attr("tabIndex",-1).focus()})}])}).call(this),function(){window.ws=window.ws||{},window.ws=function(){var a,b,c,d,e,f,g,h,i,j;return d=0,f=!1,e=!1,b=null,a=null,g=null,h=null,i=function(){return b.on("mouseenter mouseleave","span.delight",c)},j=function(){var a;return a={controls:["play","current-time","duration","mute","volume","fullscreen"],debug:!0},plyr.setup(a)},c=function(a){var b,c;return b=$(this),c=b.find(".egg"),f===!1&&(f=!0),b.hasClass("animating")?void b.removeClass("animating"):(b.addClass("animating"),d++,d>4&&(e===!1&&(e=!0),c.removeClass("hide flipOutX animated-sm"),c.addClass("flipInX animated-sm")),d>6&&c.html("Seems like you’re really enjoying yourself!"),d>8&&c.html("Seems like you’re really really enjoying yourself!"),d>10&&c.html("It's too much now! Why not take a look at my portolio?"),clearTimeout(g),void(g=setTimeout(function(){c.removeClass("flipInX animated-sm"),c.addClass("flipOutX animated-sm")},2e3)))},{init:function(){return setTimeout(function(){return b=$(document),b.foundation()},500)}}}(),$(ws.init)}.call(this),function(){"use strict";ankuragrawalApp.config(["$routeProvider","$locationProvider","$sceProvider",function(a,b,c){return a.when("/",{templateUrl:"views/landing.html",controller:"LandingCtrl",controllerAs:"landing",title:"home - ankur agrawal, wildcard designer + technologist",bodyClass:"landing"}).when("/about",{templateUrl:"views/about.html",controller:"AboutCtrl",controllerAs:"about",title:"about",bodyClass:"about"}).when("/portfolio",{templateUrl:"views/portfolio.html",controller:"PortfolioCtrl",controllerAs:"portfolio",title:"portfolio",resolve:{projects:["projectService",function(a){return a.getProjectsList()}],sidebarQnA:["sidebarService",function(a){return a.getQnA()}]}}).when("/portfolio/:projectSlug",{templateUrl:"views/project.html",controller:"ProjectCtrl",controllerAs:"project-details",title:"project",resolve:{project:["projectService","$route",function(a,b){return a.getProject(b.current.params.projectSlug)}]}}).when("/contact",{templateUrl:"views/contact.html",controller:"ContactCtrl",controllerAs:"contact",title:"contact"}).otherwise({templateUrl:"views/404.html",controller:"404Ctrl"}),b.html5Mode(!0).hashPrefix("!"),c.enabled(!1)}])}.call(this),function(){"use strict";angular.module("ankuragrawalApp").constant("constants",{BASE_CDN_URL:"http://localhost:9000/",BASE_IMAGES_URL:"images/"})}.call(this),function(){"use strict";angular.module("ankuragrawalApp").factory("dbService",["$q",function(a){var b;return b={},b.getDB=function(){return firebase.database()},b.query=function(b,c){var d;return d=a.defer(),c(this.getDB().ref("/"+b)).$loaded().then(function(a){return d.resolve(a)},function(a){return $http.get("/data/"+b+".json").success(function(a){return d.resolve(a)})}),d.promise},b}])}.call(this),function(){"use strict";angular.module("ankuragrawalApp").factory("sidebarService",["$firebaseObject","dbService",function(a,b){var c;return c={},c.collectionName="portfolio-sidebar",c.getQnA=function(){return b.query(this.collectionName,a)},c}])}.call(this),function(){"use strict";angular.module("ankuragrawalApp").factory("projectService",["$firebaseArray","$firebaseObject","dbService",function(a,b,c){var d;return d={},d.collectionName="projects",d.getProjectsList=function(){return c.query(""+this.collectionName,a)},d.getProject=function(a){return c.query(""+this.collectionName+"-details/"+a,b)},d}])}.call(this),function(){"use strict";angular.module("ankuragrawalApp").controller("AppCtrl",["$scope","$rootScope","$location","ngProgressFactory","$timeout","$anchorScroll",function(a,b,c,d,e,f){return b.landing=!1,b.colors=[{logo:["#D35950","#E46F61"],border:"#D35950"},{logo:["#5182BC","#5D8FCA"],border:"#5182BC"},{logo:["#DBA628","#EFBB37"],border:"#DBA628"},{logo:["#67AA48","#84BC69"],border:"#67AA48"},{logo:["#AF456E","#BC5679"],border:"#AF456E"},{logo:["#5069A3","#6F85BF"],border:"#5069A3"},{logo:["#35A7BA","#4DBFD9"],border:"#35A7BA"},{logo:["#773D99","#8D50AA"],border:"#773D99"}],a.closeNavbarInMobile=function(a){return c.path(a),e(function(){return $(".top-bar").hasClass("expanded")?$(".toggle-topbar").click():void 0},10)},b.getClass=function(a){var b,d;return d=Array.isArray||function(a){return"[object Array]"==={}.toString.call(a)},d(a)||(a=[a]),b=!1,angular.forEach(a,function(a){return"/"===a&&c.path()===a||"/"!==a&&c.path().substr(0,a.length)===a?b=!0:void 0}),b===!0?"active":void 0},a.gotoTop=function(){return c.hash("start-of-page"),f()}}])}.call(this),function(){"use strict";angular.module("ankuragrawalApp").controller("AboutCtrl",["$rootScope",function(a){a.landing=!1}])}.call(this),function(){"use strict";angular.module("ankuragrawalApp").controller("LandingCtrl",["$rootScope",function(a){return a.landing=!0}])}.call(this),function(){"use strict";angular.module("ankuragrawalApp").controller("PortfolioCtrl",["$scope","$rootScope","projects","sidebarQnA","constants",function(a,b,c,d,e){return b.landing=!1,a.projects=c,a.question=d.question,a.answer=d.answer,a.projectThumb=function(a){return{"background-image":"url("+e.BASE_CDN_URL+e.BASE_IMAGES_URL+"projects/"+a+"/thumb.svg)"}}}])}.call(this),function(){"use strict";angular.module("ankuragrawalApp").controller("ProjectCtrl",["$scope","$rootScope","$routeParams","project",function(a,b,c,d){return b.landing=!1,a.project=d,a.project.slug=c.projectSlug}])}.call(this),function(){"use strict";angular.module("ankuragrawalApp").controller("ContactCtrl",["$scope","$rootScope","$route","$http","$window",function(a,b,c,d,e){return b.landing=!1,a.contact={},a.submitForm=function(b){return console.log("Message sent successfully"),d.post("https://formspree.io/ankuragrawal@ymail.com",b).then(function(b){return b.data.success?(a.contact={},a.$parent.success=!0):void 0},function(b){return a.$parent.error=!0})}}])}.call(this),function(){"use strict";angular.module("ankuragrawalApp").controller("404Ctrl",function(){})}.call(this),function(){"use strict";angular.module("ankuragrawalApp").filter("split",function(){return function(a,b){return a.split(b)}})}.call(this),angular.module("ankuragrawalApp").run(["$templateCache",function(a){"use strict";a.put("views/404.html",'<div class="about grid-x grid-padding-x"> <div ng-include="\'views/partials/_sidebar.html\'" class="cell medium-3 side-bar"></div> <div class="cell auto"> <div class="grid-x grid-padding-x grid-padding-y align-center"> <div class="cell small-8 medium-7 large-6 text-center"> <ng-include src="\'images/404.svg\'" alt="404"></ng-include> <br> <br> <h3 class="muted">Something didn\'t go right!!</h3> <!-- <h5 class="muted">Why did you type that..</h5> --> <br> <a href="javascript:history.back();" class="button">Let\'s try again from previous page</a> </div> </div> </div> </div>'),a.put("views/about.html",'<div class="grid-x"> <div class="cell small-8 medium-6 large-4"> <ng-include src="\'images/coming-soon.a9ed0b3a.svg\'"></ng-include> </div> </div>'),a.put("views/contact.html",'<div class="grid-x"> <div class="cell small-8 medium-6 large-4"> <div class="cell auto"> <h6>Feel free to contact me for any kind of collaboration, talk or just say Hi!</h6> </div> <div class="cell auto form"> <!-- Error message --> <div class="error" ng-show="error"> <p>I\'m really sorry, looks like there was an issue.</p> </div> <!-- Success message --> <div class="success" ng-show="success"> <p>Appretiate your email! Please give me some time to reply back.</p> </div> <form role="form" name="contactform" method="post" ng-submit="contactform.$valid && submitForm(contact)" accept-charset="UTF-8" autocomplete="off" enctype="multipart/form-data" ng-controller="ContactCtrl" ng-hide="success"> <div class="row"> <div class="medium-6 columns"> <label>Name <input id="name" type="text" name="name" ng-model="contact.name" placeholder="" maxlength="255" required> </label> </div> <div class="medium-6 columns"> <label>Email address <input id="email" type="email" name="email" ng-model="contact.email" placeholder="" required> </label> </div> <div class="medium-6 columns"> <label>Message <textarea id="message" name="message" rows="4" ng-model="contact.message" placeholder="" required></textarea> </label> </div> </div> <div class="row"> <input type="submit" class="button tip-top" value="Send" ng-disable="contactform.$invalid" tooltips tooltip-template="Ready to send it my way?"> </div> </form> </div> </div> </div>'),a.put("views/landing.html",'<div ng-controller="LandingCtrl"> <div class="grid-x align-center logo"> <div class="cell medium-3"> <a ng-href="" ng-click="closeNavbarInMobile(\'/about\')" ng-include="\'images/logo.cc1431d7.svg\'"></a> </div> </div> <div class="grid-x align-center"> <div class="cell medium-6 tagline animated fadeInUp a4"> <ng-include src="\'views/partials/_tagline.html\'"></ng-include> </div> </div> </div>'),a.put("views/partials/_footer.html",'<footer class="footer"> <div class="top-bar grid-x"> <div class="top-bar-left large-6 small-12 cell"> <div class="side-social animated fadeIn"> &nbsp; <br> <ul class="menu social-list"> <li> <a href="http://twitter.com/iamankuragrawal" target="_blank" class="bg-s-3"> <span class="sr-only">Click to visit ankur\'s twitter account.</span><em class="icon icon-twitter"></em> </a> </li> <li> <a href="https://www.linkedin.com/in/iamankuragrawal" target="_blank" class="bg-s-2"> <span class="sr-only">Click to visit ankur\'s linkedin account.</span><em class="icon icon-linkedin"></em> </a> </li> <li> <a href="http://dribbble.com/iamankuragrawal" target="_blank" class="bg-s-1"> <span class="sr-only">Click to visit ankur\'s dribbble account.</span> <em class="icon icon-dribbble"></em> </a> </li> <li> <a href="http://github.com/iamankuragrawal" target="_blank" class="bg-s-4"> <span class="sr-only">Click to visit ankur\'s github account.</span> <em class="icon icon-github"></em> </a> </li> </ul> </div> </div> <div class="large-6 small-12 cell animated fadeIn"> <div class="side-footer"> <p class="muted"> <span class="sr-only">Copyright to ankur agrawal</span> <span aria-hidden="true">&copy; ankur - made with</span> <br> <span class="builton"> <span class="sr-only">This website is built on </span> <a href="http://yeoman.io" target="_blank" tooltips aria-haspopup="true" class="tip-top" tooltip-template="Yeoman!!"> <span class="sr-only">Yeoman</span> <img src="data:image/png;charset=utf-8;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAjCAYAAAD17ghaAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyRpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoTWFjaW50b3NoKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpGREREQjJCRTM3NEQxMUUzOTJFNkE2ODU2MzIyNTY4NSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpGREREQjJCRjM3NEQxMUUzOTJFNkE2ODU2MzIyNTY4NSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkZERERCMkJDMzc0RDExRTM5MkU2QTY4NTYzMjI1Njg1IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkZERERCMkJEMzc0RDExRTM5MkU2QTY4NTYzMjI1Njg1Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+zBNemgAAC2JJREFUeNqcWAl0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" alt="Yeoman"> </a> &nbsp;&nbsp; <a href="http://angularjs.org" target="_blank" tooltips aria-haspopup="true" class="tip-top" tooltip-template="Angular.js!!"> <span class="sr-only">Angular.js</span> <img src="data:image/png;charset=utf-8;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAjCAYAAAD17ghaAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyRpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoTWFjaW50b3NoKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpGREREQjJDMjM3NEQxMUUzOTJFNkE2ODU2MzIyNTY4NSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpGREREQjJDMzM3NEQxMUUzOTJFNkE2ODU2MzIyNTY4NSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkZERERCMkMwMzc0RDExRTM5MkU2QTY4NTYzMjI1Njg1IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkZERERCMkMxMzc0RDExRTM5MkU2QTY4NTYzMjI1Njg1Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+BW+6qwAACOFJREFUeNrEWFts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" alt="Angular.js"> </a> &nbsp;&nbsp; <a href="http://rubyonrails.org/" target="_blank" tooltips aria-haspopup="true" class="tip-top" tooltip-template="Ruby on Rails!!"> <span class="sr-only">Ruby on Rails</span> <img src="data:image/png;charset=utf-8;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAjCAYAAAD17ghaAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyRpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoTWFjaW50b3NoKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpCMjVEQUE2MzM3NTAxMUUzOTJFNkE2ODU2MzIyNTY4NSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpCMjVEQUE2NDM3NTAxMUUzOTJFNkE2ODU2MzIyNTY4NSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkIyNURBQTYxMzc1MDExRTM5MkU2QTY4NTYzMjI1Njg1IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkIyNURBQTYyMzc1MDExRTM5MkU2QTY4NTYzMjI1Njg1Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+BsoLYwAACPZJREFUeNrEV1ts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" alt="Ruby on Rails"> </a> &amp; &nbsp; <span class="sr-only">Ofcourse! Lots of love!!</span> <span class="c2 love" tooltips aria-haspopup="true" aria-hidden="true" tooltip-template="Ofcourse! Lots of love!!"><em class="icon icon-love"></em> </span> </span> </p> </div> </div> </div> </footer>'),a.put("views/partials/_header.html",'<header class="top-bar-container" role="banner" data-sticky-container> <!-- <a ng-click="gotoMain()" tabindex="0" class="sr-only sr-only-focusable skip-to-content">Skip to content</a> --> <div ng-include="\'views/partials/_navbar.html\'" class="sticky is-at-top is-stuck" data-sticky data-margin-top="0"></div> </header>'),a.put("views/partials/_navbar.html",'<div class="title-bar" data-responsive-toggle="responsive-menu" data-hide-for="medium"> <button class="menu-icon" type="button" data-toggle="responsive-menu"></button> <div class="title-bar-title">Menu</div> </div> <a ng-click="gotoTop()" tabindex="0" class="sr-only sr-only-focusable skip-to-content">Skip to content</a> <nav class="top-bar topbar-sticky-shrink" data-topbar role="navigation" aria-label="Site Navigation" id="responsive-menu" data-animate="hinge-in-from-top hinge-out-from-top"> <section class="top-bar-title brand anim"> <a ng-href="/" ng-click="closeNavbarInMobile(\'/\')" title="wildcard design technologist" ng-include="\'images/brand.4259d3a1.svg\'"></a> </section> <section class="top-bar-right"> <ul class="menu"> <li ng-class="getClass(\'/portfolio\')"> <a ng-href ng-click="closeNavbarInMobile(\'/portfolio\')">portfolio</a> </li> <li ng-class="getClass(\'/about\')"> <a ng-href="" ng-click="closeNavbarInMobile(\'/about\')">about</a> </li> <li> <a ng-href="files/resume.ankur-agrawal.wildcard-design-technologist.pdf" target="_blank">résumé</a> </li> <li> <a ng-href="http://blog.ankuragrawal.xyz" target="_blank">blog</a> </li> <li ng-class="getClass(\'/contact\')"> <a ng-href="" ng-click="closeNavbarInMobile(\'/contact\')">contact</a> </li> </ul> </section> </nav>'),a.put("views/partials/_sidebar.html",'<a ng-href="" ng-click="closeNavbarInMobile(\'/about\')" title="wildcard design technologist" class="sidebar-logo" ng-include="\'images/logo.cc1431d7.svg\'"></a> <p class="sidebar-tagline"> <ng-include src="\'views/partials/_tagline.html\'"></ng-include> </p> <hr> <h6 class="subheader"><em>{{question}}</em></h6> <p class="subheader" ng-bind-html="answer"></p>'),a.put("views/partials/_tagline.html",'W<span class="smaller">ILDCARD</span> <a ng-href="" ng-click="closeNavbarInMobile(\'/portfolio\')">designer</a> + <a ng-href="" ng-click="closeNavbarInMobile(\'/portfolio\')">technologist</a> learning ways to design interactive medium beyond silicon technology'),a.put("views/portfolio.html",'<!--\n<div class="grid-container">\n  <div class="grid-x grid-padding-x">\n    <a href="portfolio/{{project.id.oid}}" class="cell project-link animated fadeInUp project-item zoom flex-child-grow {{project.size}}-4" ng-repeat="project in projects | filter:searchText | filter:selectedSize track by $index" data-src=\'enter bottom and move 20px after 0.5s\' style="order: {{$index}};" ng-if="!project.archived">\n      <div class="card">\n        <img src="{{project.thumbnail}}">\n        <div class="card-section">\n          <h6>{{project.title}}</h6>\n          <p><small>{{project.shortDescription}}</small></p>\n        </div>\n      </div>\n    </a>\n  </div>\n</div>\n--> <ul role="region" aria-relevant="Project filtered" class="portfolio-grid"> <li ng-repeat="project in projects | filter:searchText | filter:selectedSize track by $index" data-src="enter bottom and move 20px after 0.5s" style="order: {{$index}}" ng-if="!project.archived" class="project-item zoom {{project.size}}"> <a ng-href="portfolio/{{project.slug}}" class="project-link animated fadeInUp"> <div class="project" class=""> <div class="project-thumb" ng-style="projectThumb(project.slug)"></div> <div class="project-title"> <h2><span class="sr-only">Project Name: </span>{{project.title}}</h2> <small><span class="sr-only">Project Tags: </span>{{project[\'short-description\']}}</small> </div> <div class="tick tip-top tip-center" ng-if="projectSeen(&quot;/portfolio/&quot;+ project.slug)" title="You have seen this project!" data-tooltip data-options="disable_for_touch:true" aria-haspopup="true"> <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewbox="0 0 24.3 14.6" enable-background="new 0 0 24.3 14.6" xml:space="preserve" style="height: 11px"> <g> <path fill="#fff" d="M0.1,7.7C0,7.9,0,8.1,0.1,8.3c0,0,6.1,6.1,6.3,6.1c0.1,0,0.5,0,0.5,0C7.2,14,15.5,2.5,15.5,2.5\n                        c0.1-0.1,0.6-0.8,0.9-1.3c0.3-0.7,0.4-1.1,0-1.2c-0.4-0.1-1,0.5-1.4,0.8c0,0-6.1,6.8-7.9,8.6C6.8,9.6,6.4,9.7,6.1,9.5L2.3,7.1\n                      C2.2,7,1.1,6.5,1.1,6.5C1,6.5,0.8,6.6,0.7,6.7L0.1,7.7z"></path> <path fill="#fff" d="M10.6,11.1c0,0,2.5,2.7,3.5,3.4c0.2,0.1,0.4,0,0.5,0l0,0c0.2,0,8.6-11.9,8.6-11.9c0.1-0.1,0.6-0.8,0.9-1.3\n                        c0.3-0.7,0.4-1.1,0-1.2c-0.4-0.1-1,0.5-1.4,0.8c0,0-6.2,6.9-7.9,8.6c-0.1,0.1-0.3,0.3-0.4,0.4c-0.2,0-0.3-0.2-0.5-0.3l-1.4-0.9\n                      L10.6,11.1z"></path> </g> </svg> </div> </div> </a> </li> </ul>'),a.put("views/project.html",'<div class="project-page"> <article role="article"> <header class="project-banner"> <div class="banner-img animated fadeIn" ng-style="{{style}}"> </div> <h2 sticky sticky-class="is-sticky" class="project-page-heading left animated" id="prj-title"> <span class="project-heading-seg-text">{{project.title}} </span> <b class="project-page-heading-sec"></b> </h2> </header> <div class="grid-y grid-padding-y"> <div class="cell small-12"> <blockquote class="intro">{{project.intro}}</blockquote> </div> <div class="cell small-12 flex-container flex-dir-column large-flex-dir-row large-align-top"> <aside class="project-metadata {{project.slug}} flex-child-grow small-order-1 medium-order-1 large-order-2"> <dl class="metadata"> <dt>Date</dt> <dd>{{project.timeline}}</dd> </dl> <dl class="metadata"> <dt>My Role</dt> <dd ng-repeat="role in project.role | split:\',\'"> {{role}} </dd> </dl> <dl class="metadata"> <dt>Tools Used</dt> <dd ng-repeat="tool in project.tools | split:\',\'"> {{tool}} </dd> </dl> <dl class="metadata"> <dt>Team Members</dt> <dd ng-repeat="member in project.team | split:\',\'"> {{member}} </dd> </dl> </aside> <div class="project-details flex-child-shrink small-order-2 medium-order-2 large-order-1"> <section class="summary"> <h6 class="section-heading">Summary</h6> <div class="section-body">{{project.summary}}</div> </section> <section class="project-description" ng-bind-html="project.description"> </section> <div ng-if="project.screenshots" class="project-screenshots" ng-if="project.screenshots != \'\'"> <ul class="small-block-grid-2 mini-block-grid-1 large-block-grid-2 portfolio-grid"> <li ng-repeat="screenshot in project.screenshots | split:\',\'"> <a href="{{screenshot}}" class="scrSht"> <img ng-src="{{screenshot}}" alt="{{screenshot}}"> </a> </li> </ul> </div> <div class="center"> <div class="voteup-anim" ng-class="{voted: isVoted}"> <a href="" ng-click="voteUp()" class="voteup"> <em class="icon icon-thumbsup"></em> <b>{{project.votes}}</b> </a> <span class="sr-only">{{project.votes}} appreciation for this project.</span> <span>{{project.votes}} </span> </div> </div> </div> </div> </div> </article> </div>');
}]);