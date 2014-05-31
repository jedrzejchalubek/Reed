Reed.controller('Navbar', function ($scope, $filter, $location, Api, State, Overlay) {

	$scope.saveForLater = function (el) {

		var overlay = Overlay.init('Loading');

		el.later = '1' - el.later.toString();

		if($scope.articles.indexOf(el) === -1) $scope.articles.push(el);

		Api.UserArticle.update({
			articleid: el.id
		}, {
			unread: el.unread.toString(),
			favourite: el.favourite.toString(),
			later: el.later.toString()
		}, function (data) {
			Overlay.update(data.status, data.message);
		}, function (data) {
			Overlay.update(data.status, data.message);
		});

	};

	$scope.markAsFav = function (el) {

		var overlay = Overlay.init('Loading');

		el.favourite = '1' - el.favourite.toString();

		if($scope.articles.indexOf(el) === -1) $scope.articles.push(el);

		Api.UserArticle.update({
			articleid: el.id
		}, {
			unread: el.unread.toString(),
			favourite: el.favourite.toString(),
			later: el.later.toString()
		}, function (data) {
			Overlay.update(data.status, data.message);
		}, function (data) {
			Overlay.update(data.status, data.message);
		});

	};

	$scope.unread = function (el) {

		el.unread = '1' - el.unread.toString();

		if($scope.articles.indexOf(el) === -1) $scope.articles.push(el);

		Api.UserArticle.update({
			articleid: el.id
		}, {
			unread: el.unread.toString(),
			favourite: el.favourite.toString(),
			later: el.later.toString()
		});

	};

	$scope.share = function (el) {
		console.log(el);
	};

});
