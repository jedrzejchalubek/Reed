var Reed = angular.module('Reed', [
	'ngResource',
	'ngCookies',
	'ngRoute',
	'ngSanitize',
	'ngAnimate',
	'ezfb',
	'ui.bootstrap'
])

	.config([
		'$locationProvider',
		'$routeProvider',
		'$httpProvider',
		'ezfbProvider',
		function ($locationProvider, $routeProvider, $httpProvider, ezfbProvider) {

		$httpProvider.interceptors.push('httpResponseInterceptorHandler');

		ezfbProvider.setInitParams({
			appId: '676983059011847',
			status: true
		});

		$routeProvider
			.when('/login', {
				templateUrl: 'app/template/login.html',
				controller: 'Login',
				requireLogin: false
			})
			.when('/add', {
				templateUrl: 'app/template/add.html',
				controller: 'Add',
				requireLogin: false
			})
			.when('/discovery', {
				templateUrl: 'app/template/discovery.html',
				controller: 'Discovery',
				requireLogin: true,
			})
			.when('/discovery?:id', {
				templateUrl: 'app/template/discovery.html',
				controller: 'Discovery',
				requireLogin: true
			});

		// If the url is unrecognized go to login
		$routeProvider.otherwise({
			redirectTo: '/discovery'
		});

	}])

	.run([
		'$rootScope',
		'$route',
		'$location',
		'AuthService',
		function ($rootScope, $route, $location, AuthService) {

		// Everytime the route in our app changes check auth status
		$rootScope.$on("$routeChangeStart", function(event, next, current) {
			// if you're logged out send to login page.
			if (next.requireLogin && !AuthService.getUserAuthenticated()) {
				event.preventDefault();
				$location.path('/login').replace();
			}
		});

	}]);
