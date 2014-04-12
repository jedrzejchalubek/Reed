Reed.service('AuthService', function ($cookieStore){

	this.getUserAuthenticated = function() {
		return ($cookieStore.get('token')) ? true : false;
	};

	return this;

});
