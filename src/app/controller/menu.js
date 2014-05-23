Reed.controller('Menu', function ($scope, $cookieStore, Api, State) {

	$scope.State = State;

    $scope.$watch('State.status', function (newStatus, oldStatus, scope) {
    	scope.status = newStatus;
    });

});
