<?php

/*
 | ------------------------------------------
 | User Controller Class
 | ------------------------------------------
*/

class UserFeeds extends Controller
{

	/**
	 * Get
	 */
	public function get($id, $query)
	{
		Response::json( $id[0] );
	}


	/**
	 * Post
	 */
	public function post($id, $query)
	{

		$data = Request::getData();

		$this->userFeed->add(array(
			'userId' => $id[0],
			'feedId' => String::normalizeUrl($data->rssUrl)
		));

		Response::json(array(
			'status' => 'ok'
		));

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
