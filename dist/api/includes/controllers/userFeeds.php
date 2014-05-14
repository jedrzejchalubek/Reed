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

		$this->userFeed->addOverwrite(array(
			'feedId' => String::md5(String::normalizeUrl($data->rssUrl)),
			'userId' => $id[0]
		));

		Response::added();

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
