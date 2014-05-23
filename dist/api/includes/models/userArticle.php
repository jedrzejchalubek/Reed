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
	protected $columns = 'id, articleid, later, favourite';

	public function fetch($id)
	{
		return $this->db->request("SELECT * FROM {$this->table} UA INNER JOIN article A ON UA.articleid = A.id WHERE UA.id = '{$id}'");
	}

	public function addOverwrite($data)
	{

		$this->db->addOverwrite(
			$this->table,
			$this->columns,
			$this->valuesToAdd(),
			'favourite = COALESCE(:favourite, favourite), later = COALESCE(:later, later)',
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
