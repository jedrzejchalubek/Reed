Reed.controller('Settings', function ($scope, $filter, Api, State, Collection, Overlay) {

	$scope.addFolder = function (name) {

		if(name) {

			var folder = false;

			_.each(Collection.folders, function (el) {
				if(el.title === name) folder = true;
			});

			if(!folder) {
				Collection.add(Collection.folders, {
					'title': name,
					'items': []
				});
			} else {
				Overlay.init('error', 'Folder exsist');
			}

		} else {
			Overlay.init('error', 'Folder name empty')
		}

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

		Api.UserFeed.delete({

			feedid: feed.id

		}, function (response) {

			_.each(response.items, function (el) {
				Collection.articles = Collection.remove(Collection.articles, el);
			});

			items.splice(index, 1);

			Overlay.init(response.status, response.message);

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
			// content: Collection.user
		};

	});

});
