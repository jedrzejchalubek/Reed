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
	protected $columns = 'id, token';

	public function isValid()
	{

		if ($_SERVER["REQUEST_URI"] == "/reed/dist/api/auth") return true;

		$user = $this->get($this->user->getId());

		if ( str_replace('"', '', $_COOKIE['token']) === $user['token'] ) {

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
	function __construct(Database $db, $user)
	{
		$this->db = $db;
		$this->user = $user;
	}

}
