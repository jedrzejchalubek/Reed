<?php

/**
* Server class
*/

class Server
{

	public static function get($query = null)
	{
		if ( isset($query) ) return $_GET[$query];
		else return $_GET;
	}

	public static function uri()
	{
		return $_GET['uri'];
	}

	public static function method()
	{
		return $_SERVER['REQUEST_METHOD'];
	}

}
