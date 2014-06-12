Reed.factory('State', function ($cookieStore) {

	/**
	 * Aplication collections counts
	 * @type {Object}
	 */
	this.count = {};


	/**
	 * Application data
	 * @type {Object}
	 */
	this.data = {};


	/**
	 * User state data
	 * @type {Object}
	 */
	this.user = {
		id: $cookieStore.get('reed_userid'),
		filter: $cookieStore.get('reed_userfilter')
	};


	/**
	 * Set new application state
	 * @param {Object} values
	 */
	this.set = function (values) {
		angular.extend(this.count, values);
		return this;
	};


	/**
	 * Update application state
	 * @param  {String} field Field to update
	 * @param  {Int} value
	 * @return {Int}
	 */
	this.update = function (field, value) {

		if(this.count[field] >= 0) {
			if(value == 0)
				return this.count[field]--;
			else
				return this.count[field] += value;
		}

		return this;

	};


	/**
	 * Return object
	 */
	return this;

});
