Reed.service('AuthService', function ($cookieStore){

	this.getUserAuthenticated = function() {

		var token = $cookieStore.get('reed_authtoken');

		if(token === 'undefined') $cookieStore.remove('token');

		return ($cookieStore.get('reed_authtoken')) ? true : false;
	};

	return this;

});
