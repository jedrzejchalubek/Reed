Reed.controller('Discovery', function ($scope, Api, State) {

	$scope.showArticle = function (el) {
		angular.extend($scope.view, {
			section: 'single',
			id: el.id,
			scrollPosition: $('#articles').scrollTop()
		});
	};

	$scope.nextArticle = function (el) {
		angular.extend($scope.view, {
			section: 'single',
			id: el.id
		});
	};

	$scope.view = {
		section: 'list',
		content: $scope.discoveryArticles
	};

	$scope.tabs = {

		side: [
			{
				title: 'All',
				content: [
					{
						user: {
							name: 'Zbyszek',
							avatar: 'https://s3.amazonaws.com/uifaces/faces/twitter/alagoon/128.jpg'
						},
						type: 'stared',
						title: 'Taming The Unicorn: Easing JavaScript Memory Profiling In Chrome DevTools'
					},
					{
						user: {
							name: 'Artur',
							avatar: 'https://s3.amazonaws.com/uifaces/faces/twitter/alagoon/128.jpg'
						},
						type: 'shared',
						title: 'Taming The Unicorn'
					}
				]
			},
			{
				title: 'Stared',
				content: ''
			},
			{
				title: 'Shared',
				content: ''
			}
		],

	};

});
