<?php

/*
 | ------------------------------------------
 | Article Controller Class
 | ------------------------------------------
*/

class Article extends Controller
{

	/**
	 * Get
	 */
	public function get($id, $query)
	{
		Response::json( $this->article->get($id[0]) );
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
