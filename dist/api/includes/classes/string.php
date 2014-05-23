<?php

/**
* String
*/
class String
{

	public static function removeQuotes($string) {
		return str_replace('"', '', $string);
	}

	public static function normalizeUrl($url) {

		if (!preg_match("~^(?:f|ht)tps?://~i", $url)) $url = "http://" . $url;

		$url = normalizeURL($url);

		return $url;

	}

	public function isUrl($string)
	{
		$regex = "((https?|ftp)\:\/\/)?"; // SCHEME
		$regex .= "([a-z0-9+!*(),;?&=\$_.-]+(\:[a-z0-9+!*(),;?&=\$_.-]+)?@)?"; // User and Pass
		$regex .= "([a-z0-9-.]*)\.([a-z]{2,3})"; // Host or IP
		$regex .= "(\:[0-9]{2,5})?"; // Port
		$regex .= "(\/([a-z0-9+\$_-]\.?)+)*\/?"; // Path
		$regex .= "(\?[a-z+&\$_.-][a-z0-9;:@&%=+\/\$_.-]*)?"; // GET Query
		$regex .= "(#[a-z_.-][a-z0-9+\$_.-]*)?"; // Anchor

		if(preg_match("/^$regex$/", $string)) {
			return true;
		}
	}

	public static function md5($string) {
		return hash('md5', $string);
	}

	public function stripAllTags($string)
	{
		return strip_tags($string);
	}

	public function stripRiskyTags($string)
	{
		$tags = "<span><a><b><tt><i><big><small><img><h1><h2><h3><h4><h5><h6><hr><ul><ol><li><dl><dt><dd><dir><em><strong><code><abbr><blockquote><sub><sup><p><br><pre><table><caption><thread><tr><th><td>";
		return strip_tags($string, $tags);
	}

}
