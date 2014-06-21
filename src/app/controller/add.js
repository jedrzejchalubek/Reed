Reed.controller('Add', function ($scope, $rootScope, $timeout, Api, State, Overlay, Collection) {

	$scope.submit = function(isValid) {

		var overlay = Overlay.init('busy', 'Loading');

		if (isValid) {

			Api.UserFeeds.post({}, $scope.form, function(response) {

				var exist = Collection.filter(Collection.feeds, {
					id: response.source.id
				});

				if(exist.length = 0) {
					Collection.folders.forEach(function(folder) {

						if(folder.title === response.folder) {

							Collection.add(Collection.feeds, response.source);
							Collection.add(folder.items, response.source);

							response.items.forEach(function (el) {
								Collection.add(Collection.articles, el);
							});

						}

					});
				}

				Overlay.init(response.status, response.message);

			}, function(response) {
				Overlay.update(response.status, 'Bad url');
			});

		} else {
			Overlay.update(response.status, 'Error');
		}

	};

	$scope.add = function(feed, feeds, index) {

		feed.proccessing = {
			under: true
		};

		Api.UserFeeds.post({
			'rssUrl': feed.url
		}, function(response) {

			feed.proccessing = {
				done: true
			};

			Collection.folders.forEach(function(folder) {

				if(folder.title === response.folder) {

					Collection.add(Collection.feeds, response.source);
					Collection.add(folder.items, response.source);

					response.items.forEach(function (el) {
						Collection.add(Collection.articles, el);
					});

				}

			});


			$timeout(function () {

				$rootScope.state = State.set({
					articles: Collection.filter('articles', {
						unread: '1'
					}).length,
				});
				Collection.discovery.feeds.splice(index, 1);

			}, 1000);

		});

	};

	Collection.ready([Collection.articles.$promise], function () {
		$scope.form = {};
		$scope.view = {
			section: 'list',
			content: Collection.discovery.feeds
		};
	});

});
