<?php

/**
* String
*/
class String
{

	public static function removeQuotes($string)
	{
		return str_replace('"', '', $string);
	}

	public static function normalizeUrl($url) {

		if (!preg_match("~^(?:f|ht)tps?://~i", $url)) $url = "http://" . $url;

		$url = normalizeURL($url);

		return $url;

	}

	public static function md5($string)
	{
		return hash('md5', $string);
	}

}
