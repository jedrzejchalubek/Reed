<?php

/*
 | ------------------------------------------
 | User folders Controller Class
 | ------------------------------------------
*/

class UserFolders extends Controller
{


	public function get($id, $query)
	{
		Response::json($this->userFolder->get($id[0]));
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
