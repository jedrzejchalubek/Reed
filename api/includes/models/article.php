<?php

/*
 | ------------------------------------------
 | Article Model Class
 | ------------------------------------------
 | General class for access articles data
*/

namespace Reed\Models;

class Article extends Model
{

	/**
	 * Database table name
	 * @var String
	 */
	protected $table = 'article';

	/**
	 * Database table columns
	 * @var String
	 */
	protected $columns = 'created, modified, url, title, description, content, image, stars';

	/**
	 * Get popularity rank
	 * Hacker News popularity ranking algorithm ((p - 1) / (t/60))/60 ^ g,
	 * where p = points(number of stars), t = time, g = gravity
	 * @return Array Feeds ordered by rank
	 */
	public function getPopular()
	{
		return $this->request("SELECT *, (({$this->table}.stars - 1) / power(((unix_timestamp(NOW()) - unix_timestamp({$this->table}.created))/60)/60, 1.8)) AS rank FROM {$this->table} ORDER BY rank DESC");
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
