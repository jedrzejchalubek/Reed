var Reed = angular.module('Reed', [
	'ngResource',
	'ngCookies',
	'ngRoute',
	'ngSanitize',
	'ngAnimate',
	'ezfb',
	'toggle-switch',
	'angularMoment',
	'ngDragDrop',
	'infinite-scroll'
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
			.when('/', {
				templateUrl: 'app/template/login.html',
				controller: 'Login',
				requireLogin: false
			})
			.when('/discover', {
				templateUrl: 'app/template/discover.html',
				controller: 'Discover',
				requireLogin: true,
			})
			.when('/all', {
				templateUrl: 'app/template/articles.html',
				controller: 'All',
				requireLogin: true
			})
			.when('/later', {
				templateUrl: 'app/template/articles.html',
				controller: 'Later',
				requireLogin: true
			})
			.when('/favourites', {
				templateUrl: 'app/template/articles.html',
				controller: 'Favourites',
				requireLogin: true
			})
			.when('/feeds/:id', {
				templateUrl: 'app/template/articles.html',
				controller: 'Feeds',
				requireLogin: true
			})
			.when('/add', {
				templateUrl: 'app/template/add.html',
				controller: 'Add',
				requireLogin: true
			})
			.when('/settings', {
				templateUrl: 'app/template/settings.html',
				controller: 'Settings',
				requireLogin: true
			})
			.when('/profile', {
				templateUrl: 'app/template/profile.html',
				controller: 'Profile',
				requireLogin: true
			});

		// If the url is unrecognized go to login
		$routeProvider.otherwise({
			redirectTo: '/discover'
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
				$location.path('/').replace();
			}
		});

	}]);
