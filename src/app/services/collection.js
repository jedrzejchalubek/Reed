Reed.factory('Collection', function ($q, $filter, Api) {

	/**
	 * User collection
	 * @type {Object}
	 */
	this.user = Api.User.get();


	/**
	 * Discovery collection
	 * @type {Object}
	 */
	this.discovery = {
		articles: Api.discoveryArticles.get(),
		feeds: Api.discoveryFeeds.get()
	};


	/**
	 * User articles collection
	 * @type {Object}
	 */
	this.articles = Api.UserArticles.get();


	/**
	 * User favourite articles
	 * @type {Object}
	 */
	this.favourites = Api.UserFavourites.get();


	/**
	 * User read later articles
	 * @type {Object}
	 */
	this.later = Api.UserLater.get();


	/**
	 * User feeds collection
	 * @type {Object}
	 */
	this.feeds = Api.UserFeeds.get();


	/**
	 * Filter collection
	 * @param  {String} collection Collection name
	 * @param  {Object} params     Filter params
	 * @return {Object}            Filtered collection
	 */
	this.add = function (collection, el) {
		if(this[collection].indexOf(el) === -1) this[collection].push(el);
		return this[collection] = this.orderBy(this[collection], '-created');
	};


	/**
	 * Order collection
	 * @param  {String} collection Collection name
	 * @param  {Object} params     Order params
	 * @return {Object}            Ordered collection
	 */
	this.orderBy = function (collection, params) {
		return $filter('orderBy')(collection, params);
	};


	/**
	 * Filter collection
	 * @param  {String} collection Collection name
	 * @param  {Object} params     Filter params
	 * @return {Object}            Filtered collection
	 */
	this.filter = function (collection, params) {
		var filter = $filter('filter')(this[collection], params);
		return this.orderBy(filter, '-created');
	};


	/**
	 * Collections ready state
	 * @param  {Array}   collection List of collections promises
	 * @param  {Function} callback   Passed promises callback
	 * @return {Object}
	 */
	this.ready = function (collections, callback) {
		return $q.all(collections).then(function(data) {
			callback(data);
		});
	};


	/**
	 * Return object
	 */
	return this;

});
