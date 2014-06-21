Reed.factory('Overlay', function () {

	/**
	 * Overlay state:icon list
	 * @type {Object}
	 */
	this.icons = {
		'success': 'check',
		'fail': 'times',
		'error': 'times',
		'400': 'times',
		'busy': 'spinner fa-spin'
	};


	/**
	 * Update displayed overlay
	 * @param  {String} status Response status
	 * @param  {String} text   Response message
	 * @return {Object}
	 */
	this.update = function (status, text) {

		this.overlay.update({
			text: text,
			icon: this.icons[status.toString().toLowerCase()]
		});

	};

	/**
	 * Display overlay
	 * @param  {String} text Response message
	 * @return {Object}
	 */
	this.init = function (status, text) {

		this.overlay = iosOverlay({
			text: text,
			icon: this.icons[status.toString().toLowerCase()],
			duration: 2000,
		});

	};

	/**
	 * Return object
	 */
	return this;

});
