Reed.factory('State', function ($cookieStore) {

	var status = {
		unread: {},
	};

	var user = {
		id: $cookieStore.get('reed_userid'),
	};

	return {
		status: status,
		user: user
	};

});
