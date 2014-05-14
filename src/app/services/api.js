Reed.factory('Api', function ($http, $cookieStore, $resource, md5) {

		return {

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

			User: $resource('api/users/:id', { id: '@id' }, {
				get: {
					method: 'GET',
					isArray: false
				}
			}),

			UserFeeds: $resource('api/users/:id/feeds', { id: $cookieStore.get('reed_userid') }, {
				get: {
					method: 'GET',
					isArray: false
				},
				post: {
					method: 'Post',
				},
			}),

		};

}).service('feedsProvider', function () {});
