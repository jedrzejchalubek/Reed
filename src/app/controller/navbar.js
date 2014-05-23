Reed.controller('Navbar', function ($scope, Api, State, Overlay) {

	$scope.saveForLater = function (el) {

		var overlay = Overlay.init('Loading');

		Api.UserArticle.update({
			articleid: el.id
		}, {
			later: 1
		}, function (data) {
			Overlay.update(data.status, data.message);
		});

	};

	$scope.markAsFav = function (el) {

		var overlay = Overlay.init('Loading');

		Api.UserArticle.update({
			articleid: el.id
		}, {
			favourite: 1
		}, function (data) {
			Overlay.update(data.status, data.message);
		});

	};

	$scope.share = function (el) {
		console.log(el);
	};

});
