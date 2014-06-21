<?php

/*
 | ------------------------------------------
 | Article Model Class
 | ------------------------------------------
 | General class for access articles data
*/

namespace Reed\Models;

class UserFolder extends Model
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
	protected $columns = 'id, feedid, folder, created';

	/**
	 * Fetch all user articles
	 * @param  String $id User id
	 * @return Array
	 */
	public function get($id)
	{

		$results = array();

		$folders = $this->request("SELECT folder FROM userFeed UF WHERE UF.id = :id GROUP BY folder", array(
				'id' => $id
			));


		foreach ((array)$folders as $folder) {

			$items = $this->request("SELECT * FROM {$this->table} UF INNER JOIN feed F ON UF.feedid = F.id WHERE UF.id = :id AND UF.folder = :folder", array(
				'id' => $id,
				'folder' => $folder['folder']
			));

			if ($folder['folder'] === null) $folder['folder'] = 'Uncategorized';
			if (empty($items)) $items = array();

			array_push($results, array(
				'title' => $folder['folder'],
				'items' => $items
			));

		}

		return $results;

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
