<?php

/*
 | ------------------------------------------
 | User articles Controller Class
 | ------------------------------------------
*/

class UserArticles extends Controller
{

	public function get($id, $query)
	{

		$data = $this->userArticle->fetch($id[0]);

		if ($data) {
			Response::json($data);
		} else {
			echo "[]";
		}


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
