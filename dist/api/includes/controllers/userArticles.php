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
			return Response::json(
				$this->userArticle->favourites($id[0])
			);
		}

		if($query['later']) {
			return Response::json(
				$this->userArticle->later($id[0])
			);
		}

		if($query['unread']) {
			return Response::json(
				$this->userArticle->unread($id[0])
			);
		}

		return Response::json(
			$this->userArticle->fetch($id[0])
		);

	}


	public function put($id, $query)
	{

		$request = Request::getData();

		foreach ($request->items as $item) {
			$this->userArticle->addOverwrite(array(
				'id' => $id[0],
				'articleid' => $item->id,
				'favourite' => $item->favourite,
				'later' => $item->later,
				'unread' => $item->unread,
				'created' => date('Y-m-d H:i:s')
			));
		}

		Response::updated(array(
			'status' => 'success',
			'message' => 'Articles saved'
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
