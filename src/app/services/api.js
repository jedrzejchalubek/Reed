Reed.factory('Api', function ($http, $resource, State) {

		var userid = State.user.id;

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

			User: $resource('api/users/:id', { id: userid }, {
				get: {
					method: 'GET',
					isArray: false
				}
			}),

			UserFeeds: $resource('api/users/:id/feeds', { id: userid }, {
				get: {
					method: 'GET',
					isArray: true
				},
				post: {
					method: 'POST',
					isArray: false
				}
			}),

			UserFeed: $resource('api/users/:id/feeds/:feedid', { id: userid }, {
				update: {
					method: 'PUT',
					isArray: false
				},
				delete: {
					method: 'DELETE',
					isArray: false
				}
			}),

			UserArticles: $resource('api/users/:id/articles', { id: userid }, {
				get: {
					method: 'GET',
					isArray: true
				},
				update: {
					method: 'PUT',
					isArray: false
				}
			}),

			UserArticle: $resource('api/users/:id/articles/:articleid', { id: userid }, {
				update: {
					method: 'PUT',
					isArray: false
				}
			}),

			UserFolders: $resource('api/users/:id/folders', { id: userid }, {
				get: {
					method: 'GET',
					isArray: true
				}
			}),

			UserFavourites: $resource('api/users/:id/articles?favourites=true', { id: userid }, {
				get: {
					method: 'GET',
					isArray: true
				}
			}),

			UserLater: $resource('api/users/:id/articles?later=true', { id: userid }, {
				get: {
					method: 'GET',
					isArray: true
				}
			}),

		};

});
