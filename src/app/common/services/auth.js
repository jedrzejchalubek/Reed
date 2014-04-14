Reed.service('AuthService', function ($cookieStore){

	this.getUserAuthenticated = function() {
		return ($cookieStore.get('reed_authtoken')) ? true : false;
	};

	return this;

});
