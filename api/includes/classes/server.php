<?php

/**
* Server class
*/
class Server
{
	
	public static function get()
	{
		return $_GET;
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