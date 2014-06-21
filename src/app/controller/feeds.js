Reed.controller('Feeds', function ($scope, $routeParams, Api, State, Collection) {


	$scope.showArticle = function (el) {

		if(el.unread == 1) State.update('articles', 0);
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

		if(el.unread == 1) State.update('articles', 0);
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
			is: 'Feeds',
			title: Collection.filter(Collection.feeds, {
				id: $routeParams.id
			})[0].title,
			section: 'list',
			content: Collection.filter(Collection.articles, {
				feed: $routeParams.id
			})
		};

	});

});
