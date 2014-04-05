<?php

/*
 | ------------------------------------------
 | Feed Controller Class
 | ------------------------------------------
*/

class Feeds extends Controller
{

	/**
	 * Get
	 */
	public function get($id, $query)
	{
		Response::json( $this->feed->fetch() );
	}

	/**
	 * Post
	 */
	public function post($id, $query)
	{
		echo "POST";
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
