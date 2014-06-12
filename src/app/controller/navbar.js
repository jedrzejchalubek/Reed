Reed.controller('Navbar', function ($scope, $filter, Api, State, Collection, Overlay) {

	$scope.saveForLater = function (el) {

		var overlay = Overlay.init('Loading');

		el.later = '1' - el.later.toString();

		if(Collection.articles.indexOf(el) === -1) Collection.articles.push(el);

		State.update('later', el.later);

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

		if(Collection.articles.indexOf(el) === -1) Collection.articles.push(el);

		State.update('favourite', el.favourite);

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

		if(Collection.articles.indexOf(el) === -1) Collection.articles.push(el);

		State.update('articles', el.unread);

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
