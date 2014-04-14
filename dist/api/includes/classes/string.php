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

}
