angular.module('login', [])

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
