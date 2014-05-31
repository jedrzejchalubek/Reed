Reed.controller('Articles', function ($scope, $timeout, $animate, $filter, Api, State) {

	$scope.showArticle = function (el) {

		el.unread = '0';

		angular.extend($scope.view, {
			panel: false,
			section: 'single',
			id: el.id,
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
			id: el.id
		});

		Api.UserArticle.update({
			articleid: el.id
		}, {
			unread: el.unread,
			favourite: el.favourite,
			later: el.later
		});

	};

	$scope.tabUnread = function () {

		var data = $filter('orderBy')($scope.articles, '[-unread, -created]');

		angular.extend($scope.view, {
			section: 'list',
			side: data,
			content: data,
		});

	};

	$scope.tabFav = function () {

		var data = $filter('filter')($scope.articles, { favourite: '1' });
			data = $filter('orderBy')(data, '[-unread, -created]');

		angular.extend($scope.view, {
			section: 'list',
			side: data,
			content: data,
		});

	};

	$scope.tabAll = function () {

		var data = $filter('orderBy')($scope.articles, '[-created]');

		angular.extend($scope.view, {
			section: 'list',
			side: data,
			content: data
		});

	};

	$scope.loadMore = function() {
		console.log('sss');
		// var last = $scope.images[$scope.images.length - 1];
		// for(var i = 1; i <= 8; i++) {
		// 	$scope.images.push(last + i);
		// }
	};

	$scope.init = function () {

		$scope.articles.$promise.then(function () {

			var articles = $filter('orderBy')($scope.articles, '[-unread, -created]');

			$scope.view = {
				section: 'list',
				content: articles,
				side: articles
			};

		});

	}



});
