Reed.controller('Add', function ($scope, $timeout, Api, State, Overlay) {

	$scope.state = State.status;
	$scope.form = {};

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
