Reed.controller('Ui', function ($scope, Api, State) {

	// $scope.user = Api.User.get();
	$scope.discoveryArticles = Api.discoveryArticles.get();
	$scope.discoveryFeeds = Api.discoveryFeeds.get();

	$scope.articles = Api.UserArticles.get();
	// $scope.feeds = Api.UserFeeds.get();


	// $scope.articles = Api.discoveryArticles.get(function(res) {

	// 	State.status.unread.articles = res.length
	// 	$scope.state = State.status;

	// });

});
