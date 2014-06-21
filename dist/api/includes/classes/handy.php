<?php


/**
* Make stuff
*/
class Handy
{

	public static function findImage($content)
	{

		preg_match('/(<img[^>]+>)/i', $content, $images);

		$blank = 'app/images/bg-blank.png';

		if($images[0]) {
			$xpath = new DOMXPath(@DOMDocument::loadHTML($images[0]));
			$imagesrc = $xpath->evaluate("string(//img/@src)");
			$imagesize = getimagesize($imagesrc);

			return ($imagesize[0] > 200 && $imagesize[1] > 100) ? $imagesrc : $blank;
		} else {
			return $blank;
		}


	}

	public static function findIcon($html) {
		// Get the 'href' attribute value in a <link rel="icon" ... />
		// Also works for IE style: <link rel="shortcut icon" href="http://www.example.com/myicon.ico" />
		// And for iOS style: <link rel="apple-touch-icon" href="somepath/image.ico">
		$matches = array();

		// Search for <link rel="icon" type="image/png" href="http://example.com/icon.png" />
		preg_match('/<link.*?rel=("|\').*icon("|\').*?href=("|\')(.*?)("|\')/i', $html, $matches);
		if (count($matches) > 4) {
			return trim($matches[4]);
		}

		// Order of attributes could be swapped around: <link type="image/png" href="http://example.com/icon.png" rel="icon" />
		preg_match('/<link.*?href=("|\')(.*?)("|\').*?rel=("|\').*icon("|\')/i', $html, $matches);
		if (count($matches) > 2) {
			return trim($matches[2]);
		}

		// No match
		return 'app/images/icon-blank.png';
	}


	public static function makeId($sting)
	{
		return String::md5(String::normalizeUrl($sting));
	}

}
