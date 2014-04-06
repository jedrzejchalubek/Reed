Reed.controller('Discovery', function ($scope, Api) {
	$scope.feeds = Api.Feeds.query();
});
