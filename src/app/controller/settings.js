Reed.controller('Settings', function ($scope, $filter, Api, State, Collection) {

	$scope.addFolder = function (name) {

		Collection.add(Collection.folders, {
			'title': name,
			'items': []
		});

	};


	$scope.changeFolder = function (folder, el) {

		if(folder.title != el.folder) {

			el.folder = folder.title;

			Api.UserFeed.update({
				feedid: el.id
			}, el);

		}

	};


	$scope.deleteFeed = function (index, feed, items) {

		items.splice(index, 1);

		Api.UserFeed.delete({
			feedid: feed.id
		});

	};


	Collection.ready([
		Collection.articles.$promise,
		Collection.feeds.$promise
	], function () {

		$scope.collection = Collection;

		$scope.view = {
			is: 'Settings',
			title: 'Organise feeds',
			section: 'list',
			content: Collection.user
		};

	});

});
