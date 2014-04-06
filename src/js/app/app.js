var Reed = angular.module('Reed', [
	'ngResource',
	'ngCookies',
	'ngRoute',
	'ezfb',
	'auth',
	'api'
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

		$rootScope.$on('$routeChangeError', function(arg1, arg2, arg3, arg4){
			if(arg4.status == 404) {
				console.log('33');
			}
		});

	}]);
