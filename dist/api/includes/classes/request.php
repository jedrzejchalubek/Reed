<?php

/**
* Server Response
* utility class
*/

class Request
{

	public static function make($location)
	{
		$ch = curl_init();

		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	    curl_setopt($ch, CURLOPT_URL, $location);
	    curl_setopt($ch, CURLOPT_HEADER, false);

	    $out = curl_exec($ch);

	    curl_close($ch);

	    return rtrim($out, 1);
	}

	public static function getData()
	{
		return json_decode(file_get_contents('php://input'));
	}


}
