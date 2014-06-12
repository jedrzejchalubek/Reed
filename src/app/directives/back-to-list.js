Reed.directive('backToList', function() {

	return {
		restrict: 'AE',
		replace: 'true',
		templateUrl: 'app/template/partials/back.html',
		link: function(scope, element, attrs) {
			element.bind('click', function() {

				scope.$apply(function() {
					scope.view.section = 'list';
					scope.view.panel = false;
				});
				$('#thumbs').scrollTop( scope.view.scrollPosition );

			});
		}
	};

});
