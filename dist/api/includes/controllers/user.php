<?php

/*
 | ------------------------------------------
 | User Controller Class
 | ------------------------------------------
*/

class User extends Controller
{

	/**
	 * Get
	 */
	public function get($id, $query)
	{
		var_dump($id[0]);
		Response::json( $this->user->get($id[0]) );
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
