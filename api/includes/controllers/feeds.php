<?php

/*
 | ------------------------------------------
 | Feed Controller Class
 | ------------------------------------------
*/
class Feeds extends Controller
{

	/**
	 * Get
	 */
	public function get($id, $parameters)
	{

		Http::header(array(
			'Cache-Control: no-cache, must-revalidate',
			'Expires: Mon, 26 Jul 1997 05:00:00 GMT',
			'Content-type: application/json; charset=UTF-8'
		));

		$arr = array();

		foreach ($id as $key => $value) {
			$arr[$key] = $value;
		}

		foreach ($parameters as $key => $value) {
			$arr[$key] = $value;
		}

		var_dump( json_encode($arr) );
		var_dump( json_encode( $this->feed->fetch()) );
	}

	/**
	 * Construct
	 * Each controller must construct parent base controller class
	 * @param Object $model Models passed to controller
	 */
	function __construct($models)
	{
		parent::__construct($models);
	}
}