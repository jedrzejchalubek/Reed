<?php

/*
 | ------------------------------------------
 | Base Controller Class
 | ------------------------------------------
 | This is general class for creating 
 | application controllers.
*/
abstract class Controller {

	protected $model;

	/**
	 * Base get method
	 * Throw error
	 */
	public function get()
	{
		Http::error();
	}

	/**
	 * Base add method
	 * Throw error
	 */
	public function post()
	{
		Http::error();
	}

	/**
	 * Base update method
	 * Throw error
	 */
	public function put()
	{
		Http::error();
	}

	/**
	 * Base delete method
	 * Throw error
	 */
	public function delete()
	{
		Http::error();
	}

	/**
	 * Construct base controller
	 * Excract models
	 * Get id
	 * Get parameters
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
		preg_match_all("/([\d-]+)/", Server::uri(), $id);

		/**
		 * Get parameters passed to URI
		 * @var Array
		 */
		$parameters = Server::get();

		/**
		 * Call controller method 
		 * based on request type
		 */
		call_user_func( array($this, Server::method()), array_shift($id), $parameters );

	}
}