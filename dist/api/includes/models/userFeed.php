<?php

/*
 | ------------------------------------------
 | Article Model Class
 | ------------------------------------------
 | General class for access articles data
*/

namespace Reed\Models;

class UserFeed extends Model
{

	/**
	 * Database table name
	 * @var String
	 */
	protected $table = 'userFeed';

	/**
	 * Database table columns
	 * @var String
	 */
	protected $columns = 'id, feedid';


	/**
	 * Construct
	 * Dependency injection
	 * @param Object $db Database
	 */
	function __construct(Database $db)
	{
		$this->db = $db;
	}

}
