<?php

/*
 | ------------------------------------------
 | Base Controller Class
 | ------------------------------------------
 | This is general class for creating
 | application controllers.
*/

abstract class Controller {

	/**
	 * Base get method
	 * Throw error
	 */
	public function get()
	{
		Response::failed();
	}

	/**
	 * Base add method
	 * Throw error
	 */
	public function post()
	{
		Response::failed();
	}

	/**
	 * Base update method
	 * Throw error
	 */
	public function put()
	{
		Response::failed();
	}

	/**
	 * Base delete method
	 * Throw error
	 */
	public function delete()
	{
		Response::failed();
	}

	/**
	 * Construct base controller
	 * Excract models
	 * Get id
	 * Get query
	 * Call child class method
	 */
	function __construct($models)
	{

		/**
		 * Excract passed models to class variables
		 */
		foreach($models as $key => $model){
			$this->{$key} = $model;
		}

		/**
		 * Get ids passed to URI
		 * @var Array
		 */
		preg_match_all("/[a-z0-9]{32}/i", Server::uri(), $id);

		/**
		 * Get query passed to URI
		 * @var Array
		 */
		$query = Server::get();

		/**
		 * Call controller method
		 * based on request type
		 */
		call_user_func( array($this, Server::method()), array_shift($id), $query );

	}
}
