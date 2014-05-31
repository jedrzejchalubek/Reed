Reed.factory('State', function ($cookieStore) {

	this.status = {
		unread: {},
	};

	this.user = {
		id: $cookieStore.get('reed_userid'),
	};

	return {
		status: this.status,
		user: this.user
	};

});
