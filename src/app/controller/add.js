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
		}, function(response) {

			feed.proccessing = {
				done: true
			};


			response.items.forEach(function (el) {
				$scope.articles.push(el);
			});

			console.log($scope.articles);

			// console.log(angular.extend($scope.articles, response.items));

			$timeout(function () {
				$scope.discoveryFeeds.splice(index, 1);
			}, 1000);

		});

	};

});
