Reed.service('httpResponseInterceptorHandler', function ($q, $location, $cookieStore) {
		return {

			/**
			 * On response error.
			 * When rejection status is unauthorized
			 * delete incorrect token and redirect user to login page
			 */
			responseError: function(rejection) {

				if (rejection.status === 401) {
					$cookieStore.remove('reed_authtoken');
					$cookieStore.remove('reed_userid');
					$location.path('/').replace();

					return $q.reject(rejection);
				}

				return $q.reject(rejection);

			}

		};
});
