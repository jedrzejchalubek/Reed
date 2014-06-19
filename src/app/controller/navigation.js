Reed.controller('Navigation', function ($scope, State, Collection) {

	$scope.count = function (collection, el) {

		switch(collection) {

			case 'unread':
				return Collection.filter('articles', {
					unread: 1
				}).length;
				break;

			case 'favourites':
				return Collection.filter('favourites', {
					favourite: 1
				}).length;
				break;

			case 'later':
				return Collection.filter('later', {
					later: 1
				}).length;
				break;

			case 'feeds':
				return Collection.filter('articles', {
					unread: 1,
					feed: el.id
				}).length;
				break;

		}

	};


	Collection.ready([
		Collection.user.$promise,
		Collection.articles.$promise,
		Collection.favourites.$promise,
		Collection.later.$promise,
		Collection.feeds.$promise
	], function() {
		$scope.collection = Collection;
	});


});


