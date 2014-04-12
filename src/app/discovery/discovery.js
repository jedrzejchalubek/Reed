Reed.controller('Discovery', ['$scope', 'feeds', function ($scope, feeds) {

	$scope.name = '222';

	$scope.unread = {
		'feeds': feeds.data.length
	}

	$scope.tabs = {

		list: [
			{
				title: "All",
				content: ''
			},
			{
				title: "Stared",
				content: ''
			},
			{
				title: "Shared",
				content: ''
			}
		],

		single: [
			{
				title: "Articles",
				content: ''
			},
			{
				title: "Feeds",
				content: ''
			}
		]

	}

}]);
