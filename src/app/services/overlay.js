Reed.factory('Overlay', function () {

	this.icons = {
		'success': 'check',
		'fail': 'times',
		'error': 'times',
		'400': 'times',
	};

	this.update = function (status, text) {

		this.overlay.update({
			text: text,
			icon: this.icons[status.toString().toLowerCase()]
		});

	};

	this.init = function (text) {

		this.overlay = iosOverlay({
			text: text,
			duration: 2000,
		});

	};

	return this;

});
