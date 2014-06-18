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

		if($query['favourites']) {
			return Response::json($this->userArticle->favourites($id[0]));
		}
		else if($query['later']) {
			return Response::json($this->userArticle->later($id[0]));
		}
		else {
			return Response::json($this->userArticle->fetch($id[0]));
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
