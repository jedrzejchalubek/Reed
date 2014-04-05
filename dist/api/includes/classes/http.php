<?php

/**
* HTTP
*/

abstract class Http
{

	public static function header($headers = array())
	{

		header('Content-type: application/json; charset=UTF-8');

		foreach ($headers as $header => $value) {
			header($value);
		}

	}

}
