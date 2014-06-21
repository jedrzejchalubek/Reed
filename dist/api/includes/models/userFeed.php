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
	protected $columns = 'id, feedid, folder, created';

	/**
	 * Fetch all user articles
	 * @param  String $id User id
	 * @return Array
	 */
	public function get($id)
	{

		return $this->request("SELECT * FROM {$this->table} UF INNER JOIN feed F ON UF.feedid = F.id WHERE UF.id = :id", array(
				'id' => $id
			));

	}

	/**
	 * Remove user feed
	 * @param  String $userid
	 * @param  String $feedid
	 */
	public function delete($userid, $feedid)
	{

		$articles = $this->db->request("SELECT * FROM article A RIGHT JOIN (SELECT A.*, UA.unread, UA.later, UA.favourite FROM userArticle UA INNER JOIN article A ON UA.articleid = A.id AND A.feed = :feedid WHERE UA.id = :userid) LA ON LA.id = A.id GROUP BY A.id", array(
				'userid' => $userid,
				'feedid' => $feedid
			));

		foreach ($articles as $article) {
			$this->request("DELETE FROM userArticle WHERE id = :userid AND articleid = :articleid", array(
				'userid' => $userid,
				'articleid' => $article['id']
			), false);
		}

		$this->request("DELETE FROM {$this->table} WHERE id = :userid AND feedid = :feedid", array(
			'userid' => $userid,
			'feedid' => $feedid
		), false);

		 return $articles;

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
