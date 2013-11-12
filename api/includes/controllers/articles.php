<?php

/*
 | ------------------------------------------
 | Articles Controller Class
 | ------------------------------------------
*/
class Articles extends Controller
{

	/**
	 * Get
	 */
	public function get($id, $parameter)
	{

		Http::header(array(
			'Cache-Control: no-cache, must-revalidate',
			'Expires: Mon, 26 Jul 1997 05:00:00 GMT',
			'Content-type: application/json; charset=UTF-8'
		));

		/**
		 * Demo to show how access uri values
		 */
		$arr = array();
		foreach ($id as $key => $value) {
			/**
			 * How access ids passed to uri
			 * Counting from left to right starts at 0
			 * /user/feeds/{id[0]}/article/{id[1]} ...
			 */
			$arr[$key] = $value;
		}
		foreach ($parameter as $key => $value) {
			/**
			 * How access parameters passed to uri
			 * /user/feeds/popular?limit=25&offset=25 ...
			 * {parameter['limit']}
			 * {parameter['offset']}
			 */
			$arr[$key] = $value;
		}
		echo json_encode($arr);


		echo json_encode( $this->article->fetch() );
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