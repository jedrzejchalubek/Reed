<?php

/**
* HTTP
*/

abstract class Http
{

	public static function getHeaders()
	{
		return apache_request_headers();
	}

	public static function getHeader($header)
	{
		$headers = self::getHeaders();
		return $headers[$header];
	}

	public static function setHeaders($headers = array())
	{

		header('Content-type: application/json; charset=UTF-8');

		foreach ($headers as $header => $value) {
			header($value);
		}

	}

}
