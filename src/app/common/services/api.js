Reed.factory('Api', function ($http) {

		return {

			getFeeds: function() {
				var promise = $http({
					method: 'GET',
					url: 'api/feeds',
				}).success(function(data, status, headers, config) {
					return data;
				});
				return promise;
			},

			// Articles: $resource('api/articles', {}, {
			// 	query: {
			// 		method: 'GET',
			// 		isArray: true
			// 	}
			// }),

			// Article: $resource('api/article/:id', { id: '@id' }, {
			// 	get: {
			// 		method: 'GET',
			// 		isArray: true
			// 	}
			// }),

		};

}).service('feedsProvider', function () {});
