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

			response.items.forEach(function (el) {
				Collection.add('articles', el);
			});

			$rootScope.state = State.update('articles', response.items.length);

			console.log(Collection.articles);

			// State.set({
			// 	articles: State.count.articles + response.items.length
			// });

			$timeout(function () {
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
