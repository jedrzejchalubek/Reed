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
	protected $columns = 'id, created, modifed, updated, url, link, title, description, image, subscribers, status';

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
		$columns = str_replace(
			array('id', 'created'),
			array('F.id', 'F.created'),
			$this->columns
		);

		return $this->request("SELECT {$columns}, ((F.subscribers - 1) / power((unix_timestamp(NOW()) - unix_timestamp(F.created) + 2), 0.25)) AS rank FROM {$this->table} F LEFT JOIN userFeed UF ON (F.id = UF.feedid AND UF.id = :id) WHERE UF.id IS NULL", array(
				'id' => $id
			));

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
