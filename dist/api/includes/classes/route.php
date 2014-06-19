<?php

/*
 | ------------------------------------------
 | Route Class
 | ------------------------------------------
 | This is general class for creating
 | single routes.
*/

class Route
{
	/**
	 * Route
	 * @var String
	 */
	private $route;

	/**
	 * Action
	 * @var Mixed
	 */
	private $controller;

	/**
	 * Route models
	 * @var Array
	 */
	private $model;


	/**
	 * Get route model
	 * @return Array Models passed to route
	 */
	public function getModel()
	{
		return $this->model;
	}


	/**
	 * Get route controller
	 * @return Mixed Contoller name or anonymous function
	 */
	public function getController()
	{
		return $this->controller;
	}


	/**
	 * Match route and prepared by router uri
	 * @return Bool
	 */
	public function match($uri)
	{
		return preg_match("#^{$this->route}$#", $uri);
	}


	/**
	 * Checking if actual uri is specifed route
	 * @param  String  $name  Route name
	 * @return boolean
	 */
	public static function is($name)
	{
		if ( end((explode('/', rtrim($_SERVER["REQUEST_URI"], '/')))) === $name ) return true;
		else
			return false;
	}


	/**
	 * Route constructor
	 * @param String $route  Route uri pattern
	 * @param Mixed  $controller Controller used by route
	 * @param Array  $model  Models used by route
	 */
	function __construct($route, $controller, $model)
	{
		$this->route = $route;
		$this->controller = $controller;
		$this->model = $model;
	}
}
