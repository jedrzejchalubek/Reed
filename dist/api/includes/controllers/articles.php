<?php

/*
 | ------------------------------------------
 | Articles Controller Class
 | ------------------------------------------
 | How access ids passed to uri
 | Counting from left to right starts at 0
 | /user/feeds/{id[0]}/article/{id[1]} ...
 |
 | How access parameters passed to uri
 | /user/feeds/popular?limit={parameter['limit']}&offset={parameter['offset']} ...
 |
*/

class Articles extends Controller
{

	/**
	 * Get
	 */
	public function get($id, $parameter)
	{
		Response::json( $this->article->fetch() );
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
