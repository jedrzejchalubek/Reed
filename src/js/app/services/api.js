angular.module('api', [])

	.service('Api', ['$resource', function ($resource) {

		return {

			Feeds: $resource('api/feeds', {}, {
				query: {
					method: 'GET',
					isArray: true
				}
			}),

		};

	}])
