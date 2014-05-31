<?php

/*
 | ------------------------------------------
 | User articles Controller Class
 | ------------------------------------------
*/

class UserArticle extends Controller
{

	public function put($id, $query)
	{

		$request = Request::getData();

		$this->userArticle->addOverwrite(array(
			'id' => $id[0],
			'articleid' => $id[1],
			'favourite' => $request->favourite,
			'later' => $request->later,
			'unread' => $request->unread,
			'created' => '2014-05-26 20:28:44'
		));

		Response::updated(array(
			'status' => 'success',
			'message' => 'Article saved'
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
