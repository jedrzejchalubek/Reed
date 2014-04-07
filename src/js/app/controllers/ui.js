Reed.controller('Ui', function ($scope) {

	$scope.handler = function () {
		alert('ss');
	}

})
.directive('click', function () {

	return {
		restrict: 'A',
		link: function (scope, el, attrs) {
			el.bind('click', function () {
				scope.$eval(attrs.click);
			});
		}
	};

});
