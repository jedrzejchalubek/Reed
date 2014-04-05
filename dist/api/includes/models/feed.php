<?php

/*
 | ------------------------------------------
 | Feed Model Class
 | ------------------------------------------
 | General class for access feeds data
*/

namespace Reed\Models;

class Feed extends Model
{

	/**
	 * Database table name
	 * @var String
	 */
	protected $table = 'feed';

	/**
	 * Database table columns
	 * @var String
	 */
	protected $columns = 'created, modified, url, title, description, img, subscribers, status';

	/**
	 * Get popularity rank
	 * Hacker News popularity ranking algorithm (p - 1) / (t + 2) ^ g,
	 * where p = points(number of subscribers), t = time, g = gravity
	 * @return Array Feeds ordered by rank
	 */
	public function getPopular()
	{
		return $this->request("SELECT *, (({$this->table}.subscribers - 1) / power((unix_timestamp(NOW()) - unix_timestamp({$this->table}.created) + 2), 0.25)) AS rank FROM {$this->table} ORDER BY rank DESC");
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
