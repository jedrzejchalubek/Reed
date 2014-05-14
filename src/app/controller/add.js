Reed.controller('Add', function ($scope, $timeout, Api, State) {

	$scope.state = State.status;
	$scope.form = {};

	$scope.submit = function(isValid) {

		if (isValid) {
			Api.UserFeeds.post({}, $scope.form);
		}

	};

	$scope.add = function(feed, feeds, index) {

		feed.proccessing = {
			under: true
		};

		Api.UserFeeds.post({}, {
			'rssUrl': feed.url
		}, function() {

			feed.proccessing = {
				done: true
			};

			$timeout(function () {
				feeds.splice(index, 1);
			}, 1000);

		});

	};

});
