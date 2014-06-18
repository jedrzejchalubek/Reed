Reed.controller('Add', function ($scope, $rootScope, $timeout, Api, State, Overlay, Collection) {

	$scope.submit = function(isValid) {

		var overlay = Overlay.init('Loading');

		if (isValid) {

			Api.UserFeeds.post({}, $scope.form, function(data) {
				Overlay.update(data.status, data.message);
			}, function(data) {
				Overlay.update(data.status, 'Bad url');
			});

		} else {
			Overlay.update('fail', 'Error');
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

			Collection.add('feeds', response.source);

			// response.items.forEach(function (el) {
			// 	Collection.add('articles', el);
			// });

			Collection.articles = response.items;

			// console.log(Collection.length('articles'));

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
