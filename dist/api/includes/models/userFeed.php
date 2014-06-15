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
	protected $columns = 'id, feedid, created';

	/**
	 * Fetch all user articles
	 * @param  String $id User id
	 * @return Array
	 */
	public function get($id)
	{
		return $this->db->request("SELECT * FROM {$this->table} UF INNER JOIN feed F ON UF.feedid = F.id WHERE UF.id = '{$id}'");
	}

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
