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

	/**
	 * Database table columns
	 * @var String
	 */
	protected $columns = 'id, authtoken, fbtoken';


	/**
	 * Generate unique token
	 * @return String token
	 */
	public function generate()
	{
		return hash('sha256', uniqid(microtime(true), true) );
	}


	/**
	 * Get user token stored inside cookie
	 * @return String token
	 */
	public function getUserToken()
	{
		$user = $this->get( \String::removeQuotes($_COOKIE['reed_userid']) );
		return $user['authtoken'];
	}


	/**
	 * Get user token timestamp
	 * @return String token
	 */
	public function expiced()
	{
		$token = $this->get( \String::removeQuotes($_COOKIE['reed_userid']) );
		$timestamp = $token['timestamp'];

		if (strtotime($timestamp) <= time() - (60*60*24*3))
			return true;
		else
			return false;

	}


	/**
	 * Check if stored token inside cookie
	 * is same as ind database
	 * or the route to AuthService
	 * @return boolean
	 */
	public function isValid()
	{

		if ( \String::removeQuotes($_COOKIE['reed_authtoken']) === $this->getUserToken() || \Route::is('auth') ) {

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
