Reed.controller('Menu', function ($scope, $cookieStore, Api, State) {

	$scope.State = State;

	$scope.toggle = function () {

		$scope.view.panel = !$scope.view.panel;

	};

    $scope.$watch('State.status', function (newStatus, oldStatus, scope) {
    	scope.status = newStatus;
    });

});
