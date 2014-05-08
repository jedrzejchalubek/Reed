Reed.controller('Menu', function ($scope, $cookieStore, Api, State) {

	$scope.State = State;

	$scope.name = Api.User.get({
		id: $cookieStore.get('reed_userid')
	});

    $scope.$watch('State.status', function (newStatus, oldStatus, scope) {
    	scope.status = newStatus;
    });

});
