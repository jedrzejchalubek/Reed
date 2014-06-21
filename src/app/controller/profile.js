Reed.controller('Profile', function ($scope, $cookieStore, $location, $timeout, Api, State, Collection, Overlay) {

	$scope.logout = function () {
		$cookieStore.remove('reed_authtoken');
		$cookieStore.remove('reed_userid');
		$location.path('/').replace();
	};

	$scope.removeProfile = function () {
		Api.User.delete({}, function () {
			Overlay.init('success', 'Account removed');
			$timeout(function () {
				$scope.logout();
				$location.path('/').replace();
			}, 500);
		});
	};

	Collection.ready([
		Collection.articles.$promise,
		Collection.feeds.$promise
	], function () {

		$scope.collection = Collection;

		$scope.view = {
			is: 'Profile',
			title: 'Profile',
			section: 'list',
			content: Collection.user
		};

	});

});
