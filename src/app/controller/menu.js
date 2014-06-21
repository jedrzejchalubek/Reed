Reed.controller('Menu', function ($scope, $filter, $rootScope, $cookieStore, Api, State, Collection) {

	$scope.toggleSidebar = function () {
		$scope.view.panel = !$scope.view.panel;
	};

	$scope.count = function (collection, el) {

		switch(collection) {

			case 'unread':
				return Collection.filter(Collection.articles, {
					unread: '1'
				}).length;
				break;

			case 'favourites':
				return Collection.filter(Collection.articles, {
					favourite: '1'
				}).length;
				break;

			case 'later':
				return Collection.filter(Collection.articles, {
					later: '1'
				}).length;
				break;

			case 'feeds':
				return Collection.filter(Collection.articles, {
					unread: '1',
					feed: el.id
				}).length;
				break;

		}

	};

	Collection.ready([
		Collection.user.$promise,
		Collection.articles.$promise,
		Collection.feeds.$promise
	], function() {

		State.data.flashback = $scope.view.content;

		$scope.collection = Collection;

	});



});
