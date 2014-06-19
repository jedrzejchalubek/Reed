Reed.controller('Menu', function ($scope, $filter, $rootScope, $cookieStore, Api, State, Collection) {

	$scope.toggleSidebar = function () {
		$scope.view.panel = !$scope.view.panel;
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
