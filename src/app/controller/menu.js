Reed.controller('Menu', function ($scope, $filter, $rootScope, $cookieStore, Api, State, Collection) {

	$scope.toggleSidebar = function () {
		$scope.view.panel = !$scope.view.panel;
	};

	$scope.filterByUnread = function () {

		if (State.user.filter == true) {

			var data = $filter('filter')($scope.view.content, { unread: "1" });

			angular.extend($scope.view, {
				section: 'list',
				content: data,
			});
		} else if(State.user.filter == false) {

			angular.extend($scope.view, {
				section: 'list',
				content: State.data.flashback,
			});

		}


	};

	$scope.sortByTitle = function () {

		var data = $filter('orderBy')($scope.view.content, '[title]');

		angular.extend($scope.view, {
			side: data,
			content: data
		});

	};

	$scope.sortByDate = function () {

		var data = $filter('orderBy')($scope.view.content, '[-created]');

		angular.extend($scope.view, {
			side: data,
			content: data
		});

	};

	$scope.showFeed = function (el) {
		angular.extend($scope.view, {
			section: 'list',
			content: Collection.filter('articles', {
				feed: el.id
			})
		});
	};


	$scope.countFeed = function (el) {
		return Collection.filter('articles', {
			unread: 1,
			feed: el.id
		}).length;
	};

	$scope.countArticles = function (el) {
		return Collection.filter('articles', {
			unread: 1,
		}).length;
	};

	$scope.countFavourites = function (el) {
		return Collection.filter('articles', {
			favourite: 1,
		}).length;
	};

	$scope.countLater = function (el) {
		return Collection.filter('articles', {
			later: 1,
		}).length;
	};

	Collection.ready([
		Collection.user.$promise,
		Collection.articles.$promise,
		Collection.feeds.$promise
	], function() {

		State.data.flashback = $scope.view.content;

		State.set({

			articles: Collection.filter('articles', {
				unread: '1'
			}).length,

			favourite: Collection.filter('articles', {
				favourite: '1'
			}).length,

			later: Collection.filter('articles', {
				later: '1'
			}).length

		});

		$scope.collection = Collection;
		$scope.state = State.set({

			articles: $scope.collection.filter('articles', {
				unread: '1'
			}).length,

			favourite: $scope.collection.filter('articles', {
				favourite: '1'
			}).length,

			later: $scope.collection.filter('articles', {
				later: '1'
			}).length

		});

		if ($scope.view.is === 'All' || $scope.view.is === 'Feeds') {
			$scope.$watch('state.user.filter', function () {
				$cookieStore.put('reed_userfilter', State.user.filter);
				$scope.filterByUnread();
			});
		}

		$rootScope.$watch('state', function (newV, oldV) {
			if(oldV === undefined && oldV === newV) return;
			$scope.state.count.articles = newV;
   		 });

	});



});
