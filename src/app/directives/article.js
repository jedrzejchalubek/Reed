Reed.directive('backToList', function() {

	return {
		restrict: 'AE',
		replace: 'true',
		templateUrl: 'app/template/partials/back.html',
		link: function(scope, element, attrs) {
			element.bind('click', function() {
				scope.$apply(function() {
					scope.show.section = 'list';
				});
				$('#articles').scrollTop( scope.show.scrollPosition );
			});
		}
	};

});
