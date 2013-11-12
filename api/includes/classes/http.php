<?php

/**
* HTTP
*/
abstract class Http
{

	public static function header($headers = array())
	{
		foreach ($headers as $header => $value) {
			header($value);
		}

		return $this;
	}


	/**
	 * Dev method to delete
	 * @return [type] [description]
	 */
	public static function fakeData()
	{
		return array(
			'News' => array(
				'Google' => array(
					'id' => '1241234', 
					'url' => 'www.google.com', 
					'name' => 'Google'
				),
				'Onet' => array('23423544', 'www.onet.pl', 'Onet'),
				'WP' => array('18253425', 'www.wp.pl', 'WP'),
				'Newsweek' => array('78341234', 'newsweek.com', 'Newsweek'),
				'Natemat' => array('345341234', 'natemat.pl', 'NaTemat')
			),
			'Rozrywka' => array(
				'9gag' => array('7861234', '9gag.com', '9GAG'),
				'kwejk' => array('67834', 'kwejk.pl', 'Kwejk')
			)
		);
	}

	/**
	 * Dev method to delete
	 * @return [type] [description]
	 */
	public function error()
	{
		header('HTTP/1.0 404 Not Found');
	    echo "<h1>404 Not Found</h1>";
	    echo "The page that you have requested could not be found.";
		exit();
	}

}