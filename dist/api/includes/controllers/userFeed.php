<?php

/*
 | ------------------------------------------
 | User articles Controller Class
 | ------------------------------------------
*/

class UserFeed extends Controller
{

	public function put($id, $query)
	{

		$request = Request::getData();

		$this->userFeed->addOverwrite(array(
			'id' => $id[0],
			'feedid' => $request->id,
			'folder' =>	$request->folder,
			'created' => $request->created
		));

		Response::updated(array(
			'status' => 'success',
			'message' => 'Feed saved'
		));

	}

	public function delete($id, $query)
	{

		$this->userFeed->delete($id[0], $id[1]);

		Response::updated(array(
			'status' => 'success',
			'message' => 'Feed deleted'
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
