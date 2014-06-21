Reed.controller('Favourites', function ($scope, $filter, Api, State, Collection) {

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
		Collection.favourites.$promise,
		Collection.feeds.$promise
	], function() {

		$scope.collection = Collection;

		$scope.view = {
			is: 'Favourites',
			title: 'Favourites',
			section: 'list',
			content: Collection.filter(Collection.articles, {
				favourite: '1'
			})
		};

	});

});
