Reed.controller('Navbar', function ($scope, $filter, Api, State, Collection, Overlay) {

	$scope.saveForLater = function (el) {

		var overlay = Overlay.init('busy', 'Loading');

		el.later = '1' - el.later;

		// if(Collection.later.indexOf(el) === -1) Collection.later.push(el);
		Collection.add(Collection.articles, el);

		Api.UserArticle.update({
			articleid: el.id
		}, {
			unread: '0',
			favourite: el.favourite.toString(),
			later: el.later.toString()
		}, function (data) {
			Overlay.destroy();
			if(el.later) {
				Overlay.init(data.status, 'Saved for later');
			} else {
				Overlay.init(data.status, 'Removed form later');
			}
		}, function (data) {
			Overlay.init(data.status, data.message);
		});

	};

	$scope.markAsFav = function (el) {

		var overlay = Overlay.init('busy', 'Loading');

		el.favourite = '1' - el.favourite;

		// if(Collection.favourites.indexOf(el) === -1) Collection.favourites.push(el);
		Collection.add(Collection.articles, el);

		Api.UserArticle.update({
			articleid: el.id
		}, {
			unread: '0',
			favourite: el.favourite.toString(),
			later: el.later.toString()
		}, function (data) {
			Overlay.destroy();
			if(el.favourite) {
				Overlay.init(data.status, 'Marked as fav');
			} else {
				Overlay.init(data.status, 'Unmarked as fav');
			}
		}, function (data) {
			Overlay.destroy();
			Overlay.init(data.status, data.message);
		});

	};

	$scope.unread = function (el) {

		el.unread = '1' - el.unread.toString();

		// if(Collection.articles.indexOf(el) === -1) Collection.articles.push(el);
		Collection.add(Collection.articles, el);

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
