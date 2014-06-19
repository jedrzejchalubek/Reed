Reed.controller('Sort', function ($scope, $filter, $cookieStore, Api, State, Collection) {


	$scope.filterByUnread = function () {

		if (State.user.filter == true) {

			var data = $filter('filter')($scope.view.content, { unread: "1" });

			angular.extend($scope.view, {
				section: 'list',
				content: data,
			});

		} else if(State.user.filter == false) {

			angular.extend($scope.view, {
				section: 'list',
				content: State.data.flashback,
			});

		}
	};


	Collection.ready([Collection.articles.$promise], function () {

		$scope.state = State;

		$scope.$watch('state.user.filter', function () {
			$cookieStore.put('reed_userfilter', State.user.filter);
			$scope.filterByUnread();
		});

	});

});
