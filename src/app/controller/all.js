Reed.controller('All', function ($scope, $filter, $cookieStore, Api, State, Collection) {

	// $scope.loadMore = function () {

	// 	var acc = Api.UserArticles.get({
	// 		offset: $scope.view.content.length - 1
	// 	});
	// 	console.log(acc);

	// };

	$scope.showArticle = function (el) {

		el.unread = '0';

		angular.extend($scope.view, {
			panel: false,
			section: 'single',
			single: el,
			scrollPosition: $('#thumbs').scrollTop()
		});

		Api.UserArticle.update({
			articleid: el.id
		}, {
			unread: el.unread,
			favourite: el.favourite,
			later: el.later
		});

	};

	$scope.nextArticle = function (el) {

		el.unread = '0';

		angular.extend($scope.view, {
			panel: false,
			section: 'single',
			single: el
		});

		Api.UserArticle.update({
			articleid: el.id
		}, {
			unread: el.unread,
			favourite: el.favourite,
			later: el.later
		});

	};


	Collection.ready([
		Collection.articles.$promise,
		Collection.feeds.$promise
	], function () {

		$scope.collection = Collection;

		$scope.view = {
			is: 'All',
			title: 'All',
			section: 'list',
			content: Collection.orderBy(Collection.articles, '-created')
		};

	});

});
