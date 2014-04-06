angular.module('auth', [])

	.service('AuthService', ['$cookieStore', function ($cookieStore){

		this.getUserAuthenticated = function() {
			return ($cookieStore.get('token')) ? true : false;
		};

		return this;

	}]);
