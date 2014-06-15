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
		// return $this->db->request("SELECT * FROM {$this->table} UA INNER JOIN article A ON UA.articleid = A.id WHERE UA.id = '{$id}'");

		return $this->db->request("SELECT * FROM article A RIGHT JOIN (SELECT A.*, UA.unread, UA.later, UA.favourite FROM {$this->table} UA INNER JOIN article A ON UA.articleid = A.id WHERE UA.id = '{$id}' AND A.created >= (SELECT UF.created FROM userFeed UF WHERE A.feed = UF.feedid) - INTERVAL 7 DAY UNION SELECT A.*, 1 as unread, 0 as later, 0 as favourite FROM userFeed UF INNER JOIN article A ON UF.feedid = A.feed WHERE UF.id = '{$id}' AND A.created >= UF.created - INTERVAL 7 DAY ) LA ON LA.id = A.id GROUP BY A.id"); }

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
