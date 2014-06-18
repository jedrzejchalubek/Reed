<?php


/**
* Make stuff
*/
class Handy
{

	public static function findImage($content)
	{

		preg_match('/(<img[^>]+>)/i', $content, $images);
		$xpath = new DOMXPath(@DOMDocument::loadHTML($images[0]));
		$imagesrc = $xpath->evaluate("string(//img/@src)");
		$imagesize = getimagesize($imagesrc);

		if($imagesize[0] > 200 && $imagesize[1] > 200)
			return $imagesrc;
		else
			return 'app/images/icon-blank.png';

	}


	public static function makeId($sting)
	{
		return String::md5(String::normalizeUrl($sting));
	}

}
