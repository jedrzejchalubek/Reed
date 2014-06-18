Reed.controller('Settings', function ($scope, $filter, Api, State, Collection) {


	Collection.ready([Collection.articles.$promise], function () {

		$scope.view = {
			is: 'Settings',
			title: 'Settings',
			section: 'list',
			content: Collection.user
		};

	});

});
