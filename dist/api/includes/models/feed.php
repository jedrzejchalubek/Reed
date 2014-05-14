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
	protected $columns = 'id, created, modifed, url, title, description, image, subscribers, status';

	/**
	 * Get feeds ordered by popularity rank
	 * Cut off the feeds that the user is already subscribed
	 * Hacker News popularity ranking algorithm (p - 1) / (t + 2) ^ g,
	 * where p = points(number of subscribers), t = time, g = gravity
	 * @return Array Feeds ordered by rank
	 */
	public function getPopular($userId)
	{

		$id = \String::removeQuotes($userId);

		return $this->request("SELECT {$this->columns}, ((A.subscribers - 1) / power((unix_timestamp(NOW()) - unix_timestamp(A.created) + 2), 0.25)) AS rank FROM {$this->table} A LEFT JOIN userFeed B ON (A.id = B.feedId AND B.userId = '{$id}') WHERE B.userId IS NULL");

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
