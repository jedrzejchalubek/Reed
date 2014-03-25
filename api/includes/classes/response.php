<?php

/**
* Server Response
* utility class
*/

class Response
{

	public function auth($token)
	{
		Http::header(array(
			"Authorization: {$token}"
		));
	}

	public static function json($data)
	{
		Http::header();

		echo json_encode($data);
	}

	public static function failed($data = null)
	{
		Http::header(array(
			'HTTP/1.0 400 Bad Request'
		));

		$data['status'] = 'fail';

		echo json_encode($data);
	}

	public static function added($data = null)
	{
		Http::header(array(
			'HTTP/1.0 201 Created'
		));

		echo json_encode($data);
	}

	public static function updated($data = null)
	{
		Http::header(array(
			'HTTP/1.0 201 Created'
		));

		echo json_encode($data);
	}

	public static function unauthorized($data = null)
	{
		Http::header(array(
			'HTTP/1.0 401 Unauthorized'
		));

		echo json_encode($data);
	}

}
