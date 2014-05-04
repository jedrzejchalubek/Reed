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
	private $method;

	/**
	 * Route models
	 * @var Array
	 */
	private $model;

	/**
	 * Get route method
	 * @return Mixed Contoller or anonymous function
	 */
	public function getModel()
	{
		return $this->model;
	}

	/**
	 * Get route method
	 * @return Mixed Contoller or anonymous function
	 */
	public function getMethod()
	{
		return $this->method;
	}

	/**
	 * Match route and prepared by router uri
	 * @return Bool
	 */
	public function match($uri)
	{
		return preg_match("#^{$this->route}$#", $uri);
	}

	public static function is($name)
	{
		if ( end((explode('/', rtrim($_SERVER["REQUEST_URI"], '/')))) === $name ) return true;
		else
			return false;
	}

	/**
	 * Route constructor
	 * @param String $route  Route uri pattern
	 * @param Mixed  $method Controller or method used by route
	 * @param Array  $model  Models used by route
	 */
	function __construct($route, $method, $model)
	{
		$this->route = $route;
		$this->method = $method;
		$this->model = $model;
	}
}
