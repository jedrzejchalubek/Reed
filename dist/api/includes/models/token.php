<?php

/*
 | ------------------------------------------
 | Article Model Class
 | ------------------------------------------
 | General class for access articles data
*/

namespace Reed\Models;

class Token extends Model
{

	/**
	 * Database table name
	 * @var String
	 */
	protected $table = 'userToken';

	public function generate()
	{
		return hash('sha256', uniqid(microtime(true), true) );
	}

	public function getUserToken()
	{
		$user = $this->get( \String::removeQuotes($_COOKIE['reed_userid']) );
		return $user['authtoken'];
	}

	/**
	 * Database table columns
	 * @var String
	 */
	protected $columns = 'id, authtoken, fbtoken';

	public function isValid()
	{

		if ($_SERVER["REQUEST_URI"] == "/reed/dist/api/auth") return true;

		if ( \String::removeQuotes($_COOKIE['reed_authtoken']) === $this->getUserToken() ) {

			return true;

		} else {

			\Response::unauthorized(array(
				'status' => '401',
				'message' => 'Given authorization token is invalid.'
			));

		}

	}

	/**
	 * Construct
	 * Dependency injection
	 * @param Object $db Database
	 */
	function __construct($db)
	{
		$this->db = $db;
	}

}
