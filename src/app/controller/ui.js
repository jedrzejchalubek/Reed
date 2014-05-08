Reed.controller('Ui', function ($scope, $cookieStore, Api, State) {

	$scope.isCollapsed =
		($cookieStore.get('reed_menustatus'))
			? $cookieStore.get('reed_menustatus')
			: $cookieStore.put('reed_menustatus', false);

	$scope.toggle = function () {
		$scope.isCollapsed = ($scope.isCollapsed) ? false : true;
		$cookieStore.put('reed_menustatus', $scope.isCollapsed);
	}

	$scope.articles = Api.discoveryArticles.get(function(res) {

		State.status = {
			unread: {
				articles: res.length
			}
		};

		$scope.state = State.status;

	});


});
