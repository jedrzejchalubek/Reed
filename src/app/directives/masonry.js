Reed.directive('masonry', function() {

	return {

		restrict: 'AC',

		controller: function($scope) {

			return $scope.$watch(function(e) {
				$scope.masonry.reloadItems();
				return $scope.masonry.layout();
			});

		},

		link: function(scope, elem, attrs) {

			var container = elem[0];
			var options = {
				columnWidth: '.articles__thumb',
				itemSelector: '.articles__thumb',
				transitionDuration: 0
			};

			return scope.masonry = new Masonry(container, options);

		}

	};

});
