angular.module('Reed', [
	'ngResource',
	'ngCookies',
	'ngRoute',
	'ezfb',
	'auth',
	'login'
])

	.config([
		'$locationProvider',
		'$routeProvider',
		'ezfbProvider',
		function ($locationProvider, $routeProvider, ezfbProvider) {

		ezfbProvider.setInitParams({
			appId: '676983059011847',
			status: true,
			cookie: true
		});

		$routeProvider
			.when('/login', {
				templateUrl: 'views/login.html',
				controller: 'Login',
				requireLogin: false
			})
			.when('/discovery', {
				templateUrl: 'views/discovery.html',
				controller: 'Discovery',
				requireLogin: true
			});

		// If the url is unrecognized go to login
		$routeProvider.otherwise({
			redirectTo: '/login'
		});

	}])

	.run(['$rootScope', '$route', 'AuthService', '$location', function ($rootScope, $route, AuthService, $location) {

		// Everytime the route in our app changes check auth status
		$rootScope.$on("$routeChangeStart", function(event, next, current) {
			// if you're logged out send to login page.
			if (next.requireLogin && !AuthService.getUserAuthenticated()) {
				$location.path('/login').replace();
        		event.preventDefault();
			}
		});

	}])

	.service('Api', ['$resource', '$cookieStore', function ($resource, $cookieStore) {

		return {

			Feeds: $resource('api/feeds', {}, {
				query: {
					method: 'GET',
					isArray: true,
					headers: {
						'Authorization': $cookieStore.get('token')
					}
				}
			}),

		};

	}])

	.controller('Discovery', function ($scope, Api) {
		$scope.feeds = Api.Feeds.query();
	});
;angular.module('auth', [])

	.service('AuthService', ['$cookieStore', function ($cookieStore){

		this.getUserAuthenticated = function() {
			return ($cookieStore.get('token')) ? true : false;
		};

		return this;

	}]);
;angular.module('login', [])

	.controller('Login', [
		'$scope',
		'$resource',
		'$location',
		'$cookieStore',
		'ezfb',
		'AuthService',
		function ($scope, $resource, $location, $cookieStore, ezfb, AuthService) {

			if ($cookieStore.get('token')) {
				$location.path('/discovery').replace();
			}

			$scope.login = function () {

				ezfb.login(function (res) {

					var AuthToken = $resource('api/auth', {}, {
						get: {
							method: 'GET',
							headers: {
								'Authorization': res.authResponse.accessToken
							}
						}
					});

					var user = AuthToken.get({}, function () {
						$cookieStore.put('token', user.token);
						$location.path('/discovery').replace();
					});

				});

			};

			$scope.logout = function () {

				ezfb.logout(function () {
					console.log('Logout');
				});

			};

		}

	]);
;/*! angular-easyfb
version: 1.0.0
build date: 2014-03-29
author: Robin Fan
https://github.com/pc035860/angular-easyfb.git */
!function(a){function b(b,c){var d="ezfb-social-plugin-wrap",e="display: inline-block; width: 0; height: 0; overflow: hidden;",f=function(a){var b='<span class="'+d+'" style="'+e+'">';return a.wrap(b).parent()},g=function(a){return a.parent().hasClass(d)},h=function(a){var b=a.parent();return b.after(a).remove(),a};a.directive(c,["ezfb",function(a){return{restrict:"EC",require:"?^ezfbXfbml",link:function(c,d,e,i){function j(a){return function(){var b;k&&a===l&&(b=e.onrender,b&&c.$eval(b),k=!1,h(d))}}if(!i){var k=!1,l=0;c.$watch(function(){var a=[];return angular.forEach(b,function(b){a.push(e[b])}),a},function(){l++,k?a.XFBML.parse(d.parent()[0],j(l)):(k=!0,a.XFBML.parse(f(d)[0],j(l)))},!0),d.bind("$destroy",function(){g(d)&&h(d)})}}}}])}a.provider("ezfb",function(){function a(a,b){return angular.isObject(b)?void angular.extend(a,b):angular.copy(a)}function b(a,b,c){return function(){return a.apply(b,c)}}var c=-1,d={api:[1,2,3],ui:1,getAuthResponse:c,getLoginStatus:0,login:0,logout:0,"Event.subscribe":1,"Event.unsubscribe":1,"XFBML.parse":1,"Canvas.Prefetcher.addStaticResource":c,"Canvas.Prefetcher.setCollectionMode":c,"Canvas.hideFlashElement":c,"Canvas.scrollTo":c,"Canvas.setAutoGrow":c,"Canvas.setDoneLoading":0,"Canvas.setSize":c,"Canvas.setUrlHandler":0,"Canvas.showFlashElement":c,"Canvas.startTimer":c,"Canvas.stopTimer":0},e="en_US",f={status:!0,cookie:!0,xfbml:!0},g=["$window","$document","ezfbAsyncInit","ezfbLocale",function(a,b,c,d){!function(a){var b,c="facebook-jssdk",e=a.getElementsByTagName("script")[0];a.getElementById(c)||(b=a.createElement("script"),b.id=c,b.async=!0,b.src="//connect.facebook.net/"+d+"/all.js",e.parentNode.insertBefore(b,e))}(b[0]),a.fbAsyncInit=c}],h=g,i=["$window","ezfbInitParams",function(a,b){a.FB.init(b)}],j=i;return{setInitParams:function(b){a(f,b)},getInitParams:function(){return a(f)},setLocale:function(a){e=a},getLocale:function(){return e},setLoadSDKFunction:function(a){if(!angular.isArray(a)&&!angular.isFunction(a))throw new Error("Init function type error.");h=a},getLoadSDKFunction:function(){return h},setInitFunction:function(a){if(!angular.isArray(a)&&!angular.isFunction(a))throw new Error("Init function type error.");j=a},getInitFunction:function(){return j},$get:["$window","$q","$document","$parse","$rootScope","$injector",function(g,k,l,m,n,o){var p,q,r,s,t;return r={},s=k.defer(),(f.appId||j!==i)&&s.resolve(),p=k.defer(),l[0].getElementById("fb-root")||l.find("body").append('<div id="fb-root"></div>'),t=function(){s.promise.then(function(){o.invoke(j,null,{ezfbInitParams:f}),q.$$ready=!0,p.resolve()})},o.invoke(h,null,{ezfbAsyncInit:t,ezfbLocale:e}),q={$$ready:!1,init:function(b){a(f,b),s.resolve()}},angular.forEach(d,function(a,d){var e=m(d),f=e.assign;f(q,function(){var f=b(function(b){var f,h;if(f=k.defer(),h=function(a){var c,e;for(c=angular.isFunction(b[a])?b[a]:angular.noop,e=function(){var a=Array.prototype.slice.call(arguments);n.$$phase?(c.apply(null,a),f.resolve.apply(f,a)):n.$apply(function(){c.apply(null,a),f.resolve.apply(f,a)})};b.length<=a;)b.push(null);var g;if("Event.subscribe"===d)g=b[0],angular.isUndefined(r[g])&&(r[g]=[]),r[g].push({original:c,wrapped:e});else if("Event.unsubscribe"===d&&(g=b[0],angular.isArray(r[g]))){var h,i,j=r[g].length;for(h=0;j>h;h++)if(i=r[g][h],i.original===c){e=i.wrapped,r[g].splice(h,1);break}}b[a]=e},a!==c)if(angular.isNumber(a))h(a);else if(angular.isArray(a)){var i,j;for(i=0;i<a.length;i++)if(j=a[i],b.length==j||b.length==j+1&&angular.isFunction(b[j])){h(j);break}}var l=e(g.FB);if(!l)throw new Error("Facebook API `FB."+d+"` doesn't exist.");return l.apply(g.FB,b),f.promise},null,[Array.prototype.slice.call(arguments)]);if("getAuthResponse"===d){if(angular.isUndefined(g.FB))throw new Error("`FB` is not ready.");return g.FB.getAuthResponse()}return a!==c?p.promise.then(f):void p.promise.then(f)})}),q}]}}).directive("ezfbXfbml",["ezfb","$parse","$compile","$timeout",function(a,b,c,d){return{restrict:"EAC",controller:function(){},compile:function(e){var f=e.html();return function(e,g,h){var i=!0,j=h.onrender,k=function(){i&&(j&&e.$eval(j),i=!1)};a.XFBML.parse(g[0],k);var l=b(h.ezfbXfbml).assign;e.$watch(h.ezfbXfbml,function(b){b&&(i=!0,g.html(f),c(g.contents())(e),d(function(){a.XFBML.parse(g[0],k)}),(l||angular.noop)(e,!1))},!0)}}}}]);var c={fbLike:["action","colorscheme","href","kidDirectedSite","layout","ref","share","showFaces","width"],fbShareButton:["href","layout","width"],fbSend:["colorscheme","href","kidDirectedSite","ref"],fbPost:["href","width"],fbFollow:["colorscheme","href","kidDirectedSite","layout","showFaces","width"],fbComments:["colorscheme","href","mobile","numPosts","orderBy","width"],fbActivity:["action","appId","colorscheme","filter","header","height","linktarget","maxAge","recommendations","ref","site","width"],fbRecommendations:["action","appId","colorscheme","header","height","linktarget","maxAge","ref","site","width"],fbRecommendationsBar:["action","href","maxAge","numRecommendations","readTime","ref","side","site","trigger"],fbLikeBox:["colorscheme","forceWall","header","height","href","showBorder","showFaces","stream","width"],fbFacepile:["action","appId","colorscheme","href","maxRows","size","width"]};angular.forEach(c,b)}(angular.module("ezfb",[]));;/*! ngStorage 0.3.0 | Copyright (c) 2013 Gias Kay Lee | MIT License */"use strict";!function(){function a(a){return["$rootScope","$window",function(b,c){for(var d,e,f,g=c[a]||(console.warn("This browser does not support Web Storage!"),{}),h={$default:function(a){for(var b in a)angular.isDefined(h[b])||(h[b]=a[b]);return h},$reset:function(a){for(var b in h)"$"===b[0]||delete h[b];return h.$default(a)}},i=0;i<g.length;i++)(f=g.key(i))&&"ngStorage-"===f.slice(0,10)&&(h[f.slice(10)]=angular.fromJson(g.getItem(f)));return d=angular.copy(h),b.$watch(function(){e||(e=setTimeout(function(){if(e=null,!angular.equals(h,d)){angular.forEach(h,function(a,b){angular.isDefined(a)&&"$"!==b[0]&&g.setItem("ngStorage-"+b,angular.toJson(a)),delete d[b]});for(var a in d)g.removeItem("ngStorage-"+a);d=angular.copy(h)}},100))}),"localStorage"===a&&c.addEventListener&&c.addEventListener("storage",function(a){"ngStorage-"===a.key.slice(0,10)&&(a.newValue?h[a.key.slice(10)]=angular.fromJson(a.newValue):delete h[a.key.slice(10)],d=angular.copy(h),b.$apply())}),h}]}angular.module("ngStorage",[]).factory("$localStorage",a("localStorage")).factory("$sessionStorage",a("sessionStorage"))}();