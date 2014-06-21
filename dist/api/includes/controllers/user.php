<?php

/*
 | ------------------------------------------
 | User Controller Class
 | ------------------------------------------
*/

class User extends Controller
{

	/**
	 * Get
	 */
	public function get($id, $query)
	{
		Response::json( $this->user->get($id[0]) );
	}

	/**
	 * Get
	 */
	public function put($id, $query)
	{

		$request = Request::getData();

		Response::json(
			$this->user->update(array(
				'id' => $id,
				'name' => $request->name,
				'last' => $request->last,
				'email' => $request->email,
				'homepage' => $request->homepage
			))
		);

	}

	/**
	 * Get
	 */
	public function delete($id, $query)
	{

		$this->user->delete($id[0]);
		$this->token->delete($id[0]);

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
