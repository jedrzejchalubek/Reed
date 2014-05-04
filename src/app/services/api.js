Reed.factory('Api', function ($http, $resource) {

		return {

			// getDiscoveryFeeds: function() {
			// 	var promise = $http({
			// 		method: 'GET',
			// 		url: 'api/discovery/feeds',
			// 	}).success(function(data, status, headers, config) {
			// 		return data;
			// 	});
			// 	return promise;
			// },

			// getDiscoveryArticles: function() {
			// 	var promise = $http({
			// 		method: 'GET',
			// 		url: 'api/discovery/articles',
			// 	}).success(function(data, status, headers, config) {
			// 		return data;
			// 	});
			// 	return promise;
			// },
			//

			discoveryFeeds: $resource('api/discovery/feeds', {}, {
				get: {
					method: 'GET',
					isArray: true
				}
			}),

			discoveryArticles: $resource('api/discovery/articles', {}, {
				get: {
					method: 'GET',
					isArray: true
				}
			}),

			Article: $resource('api/articles/:id', { id: '@id' }, {
				get: {
					method: 'GET',
					isArray: false
				}
			}),

		};

}).service('feedsProvider', function () {});
