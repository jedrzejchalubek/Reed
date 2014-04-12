Reed.service('httpResponseInterceptorHandler', ['$q', '$location', '$cookieStore', function ($q, $location, $cookieStore) {
		return {

			/**
			 * On response error.
			 * When rejection status is unauthorized
			 * delete incorrect token and redirect user to login page
			 */
			responseError: function(rejection) {

				if (rejection.status === 401) {
					$cookieStore.remove('token');
					$location.path('/login');

					return $q.reject(rejection);
				}

				return $q.reject(rejection);

			}

		};
}]);
