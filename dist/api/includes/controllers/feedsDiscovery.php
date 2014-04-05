<?php

/*
 | ------------------------------------------
 | Feed Controller Class
 | ------------------------------------------
*/

class FeedsDiscovery extends Controller
{

	/**
	 * Get popular feeds
	 */
	public function get($id, $query)
	{
		Response::json( $this->feed->getPopular() );
	}

	/**
	 * Construct
	 * Each controller must construct parent base controller class
	 * @param Object $model Models passed to controller
	 */
	function __construct($models)
	{
		parent::__construct($models);
	}
}
