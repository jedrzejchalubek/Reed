Reed.service('AuthService', function ($cookieStore){

	this.getUserAuthenticated = function() {

		var token = $cookieStore.get('reed_authtoken');
		return ($cookieStore.get('reed_authtoken')) ? true : false;

	};

	return this;

});
