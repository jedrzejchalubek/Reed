<?php

/*
 | ------------------------------------------
 | Article Model Class
 | ------------------------------------------
 | General class for access articles data
*/

namespace Reed\Models;

class UserArticle extends Model
{

	/**
	 * Database table name
	 * @var String
	 */
	protected $table = 'userArticle';

	/**
	 * Database table columns
	 * @var String
	 */
	protected $columns = 'id, articleid, unread, later, favourite, created';

	/**
	 * Fetch all user articles
	 * @param  String $id User id
	 * @return Array
	 */
	public function fetch($id)
	{
		return $this->db->request("SELECT *, UA.unread FROM {$this->table} UA INNER JOIN article A ON UA.articleid = A.id WHERE UA.id = '{$id}'");
	}

	/**
	 * Add or overwrite user articles
	 * On duplicated overwrite only flags
	 * @param Array $data
	 */
	public function addOverwrite($data)
	{

		$this->db->addOverwrite(
			$this->table,
			$this->columns,
			$this->valuesToAdd(),
			'unread = COALESCE(:unread, unread), favourite = COALESCE(:favourite, favourite), later = COALESCE(:later, later)',
			$data
		);

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
