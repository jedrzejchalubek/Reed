Reed.controller('Add', function ($scope, Api, State) {

	$scope.state = State.status;
	$scope.form = {};

	$scope.submit = function(isValid) {

		if (isValid) {
			Api.UserFeeds.post({}, $scope.form);
		}

	};

});
