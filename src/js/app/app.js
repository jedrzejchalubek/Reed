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
