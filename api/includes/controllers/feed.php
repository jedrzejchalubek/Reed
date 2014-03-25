<?php

/*
 | ------------------------------------------
 | Feed Controller Class
 | ------------------------------------------
*/

class Feed extends Controller
{

	/**
	 * Get
	 */
	public function get($id, $query)
	{
		Response::json( $this->feed->get($id[0]) );
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
