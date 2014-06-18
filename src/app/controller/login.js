Reed.controller('Login', function ($scope, $resource, $location, $cookieStore, ezfb, AuthService) {

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
						$cookieStore.put('reed_userid', user.userid);
						$cookieStore.put('reed_authtoken', user.authtoken);
						$location.path('/discovery').replace();
					});

				}, { scope: 'email' });

			};

			$scope.logout = function () {

				ezfb.logout(function () {
					console.log('Logout');
				});

			};

			/**
			 * While user is already authenticated
			 * redirect to app.
			 */
			if (AuthService.getUserAuthenticated()) {
				$location.path('/discovery').replace();
			}

			/**
			 * While user isn't authenticated,
			 * but is already connected to facebook
			 * procced normal authentication workflow.
			 */
			// ezfb.getLoginStatus(function (res) {
			// 	if (res.status === 'connected') {
			// 		$scope.login();
			// 	}
			// });

		}

);
