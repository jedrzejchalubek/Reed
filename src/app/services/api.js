Reed.factory('Api', function ($http, $resource, State) {

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

			User: $resource('api/users/:id', { id: State.user.id }, {
				get: {
					method: 'GET',
					isArray: false
				}
			}),

			UserFeeds: $resource('api/users/:id/feeds', { id: State.user.id }, {
				get: {
					method: 'GET',
					isArray: true
				},
				post: {
					method: 'POST',
					isArray: false
				}
			}),

			UserArticles: $resource('api/users/:id/articles', { id: State.user.id }, {
				get: {
					method: 'GET',
					isArray: true
				},
			}),

			UserArticle: $resource('api/users/:id/articles/:articleid', { id: State.user.id }, {
				update: {
					method: 'PUT',
					isArray: false
				}
			}),

			UserFavourites: $resource('api/users/:id/articles?favourites=true', { id: State.user.id }, {
				get: {
					method: 'GET',
					isArray: true
				}
			}),

			UserLater: $resource('api/users/:id/articles?later=true', { id: State.user.id }, {
				get: {
					method: 'GET',
					isArray: true
				}
			}),

		};

});
