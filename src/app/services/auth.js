Reed.service('AuthService', function ($cookieStore){

	/**
	 * Get user authentication status
	 * @return {Bool}
	 */
	this.getUserAuthenticated = function() {

		var token = $cookieStore.get('reed_authtoken');
		return ($cookieStore.get('reed_authtoken')) ? true : false;

	};


	/**
	 * Return object
	 */
	return this;

});
