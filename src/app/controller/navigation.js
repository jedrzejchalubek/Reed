Reed.controller('Navigation', function ($scope, State, Collection) {

	$scope.showFeed = function (el) {
		angular.extend($scope.view, {
			section: 'list',
			content: Collection.filter('articles', {
				feed: el.id
			})
		});
	};


	$scope.countFeed = function (el) {
		return Collection.filter('articles', {
			unread: 1,
			feed: el.id
		}).length;
	};


	Collection.ready([
		Collection.user.$promise,
		Collection.articles.$promise,
		Collection.feeds.$promise
	], function() {

		$scope.collection = Collection;

	});


});


