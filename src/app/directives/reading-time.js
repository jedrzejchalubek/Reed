Reed.directive('readingTime', function(State) {

	return {
		restrict: 'AE',
		scope: {
			text: '='
		},
		template: '{{readingtime}}',
		link: function(scope, element, attrs) {

			function countWords(s){
				s = s.replace(/(^\s*)|(\s*$)/gi,"");
				s = s.replace(/[ ]{2,}/gi," ");
				s = s.replace(/\n /,"\n");
				return s.split(' ').length;
			}

			var words = countWords(scope.text.content.replace(/(<([^>]+)>)/ig,""));

			var minutesCount = Math.floor(words / 200);
			var secondsCount = Math.floor(words % 200 / (200 / 60));

			var duration = '0:' + minutesCount + ":" + secondsCount;

			scope.readingtime = moment.duration(duration, "minutes").humanize();

		}
	};

});
