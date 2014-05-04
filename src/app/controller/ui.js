Reed.controller('Ui', ['$scope', '$cookieStore', function ($scope, $cookieStore) {

	$scope.isCollapsed =
		($cookieStore.get('reed_menustatus'))
			? $cookieStore.get('reed_menustatus')
			: $cookieStore.put('reed_menustatus', false);

	$scope.toggle = function () {
		$scope.isCollapsed = ($scope.isCollapsed) ? false : true;
		$cookieStore.put('reed_menustatus', $scope.isCollapsed);
	}

}]);
