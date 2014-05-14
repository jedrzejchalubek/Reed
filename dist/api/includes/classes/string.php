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

	public function normalizeUrl($url) {

		if (!preg_match("~^(?:f|ht)tps?://~i", $url)) $url = "http://" . $url;

		$url = normalizeURL($url);

		return $url;

	}

}
