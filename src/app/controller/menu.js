Reed.controller('Menu', function ($scope, $filter, $rootScope, $cookieStore, Api, State, Collection) {

	$scope.toggleSidebar = function () {
		$scope.view.panel = !$scope.view.panel;
	};

	$scope.markAllAsRead = function () {
		_.each($scope.view.content, function (el) {
			angular.extend(el, {
				unread: '0'
			});
		});

		Api.UserArticles.update({
			'items': $scope.view.content
		});
	};

	$scope.count = function (collection, el) {

		switch(collection) {

			case 'unread':
				return Collection.filter(Collection.articles, {
					unread: '1'
				}).length;
				break;

			case 'favourites':
				return Collection.filter(Collection.favourites, {
					favourite: '1'
				}).length;
				break;

			case 'later':
				return Collection.filter(Collection.later, {
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
