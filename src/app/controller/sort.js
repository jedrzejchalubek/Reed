Reed.controller('Sort', function ($scope, $filter, $cookieStore, Api, State, Collection, Overlay) {


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


	$scope.markAllAsRead = function () {
		_.each($scope.view.content, function (el) {
			angular.extend(el, {
				unread: '0'
			});
		});

		Api.UserArticles.update({
			'items': $scope.view.content
		}, function (response) {
			Overlay.init(response.status, 'All articles marked as read');
		});
	};


	Collection.ready([Collection.articles.$promise], function () {

		$scope.state = State;

		$scope.$watch('state.user.filter', function () {
			$cookieStore.put('reed_userfilter', State.user.filter);
			$scope.filterByUnread();
		});

	});

});
