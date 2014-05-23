<?php

/*
 | ------------------------------------------
 | Article Controller Class
 | ------------------------------------------
*/

class ArticlesDiscovery extends Controller
{

	/**
	 * Get popular feeds
	 */
	public function get($id, $query)
	{
		Response::json( $this->article->getPopular($this->user->getId()) );
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
