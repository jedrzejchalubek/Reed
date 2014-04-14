<?php

/**
* HTTP
*/

abstract class Http
{

	public static function setHeaders($headers = array())
	{

		header('Content-type: application/json; charset=UTF-8');

		foreach ($headers as $header => $value) {
			header($value);
		}

	}

	public static function getHeader($header)
	{
		$headers = getallheaders();
		return $headers[$header];
	}

}
