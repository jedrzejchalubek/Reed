<?php

/*
 | ------------------------------------------
 | Database class
 | ------------------------------------------
 | This class is responsible for handling
 | database operations
*/

namespace Reed\Models;
use PDO;

class Database
{

	private $host;
	private $name;
	private $user;
	private $pass;
	private $conn;

	/**
	 * Get specifed row by id
	 * @param  String $table
	 * @param  String $md5
	 * @return Array $row
	 */
	public function get($table, $md5)
	{
		$row = $this->query("SELECT * FROM $table WHERE md5 = :md5 LIMIT 1", array(
			'md5' => $md5
		));
		$row = ( $row->rowCount() > 0 ) ? $row->fetchAll(PDO::FETCH_ASSOC) : false;

		return $row[0];
	}

	/**
	 * Fetching rows from table
	 * @param  String $table
	 * @return Array
	 */
	public function fetch($table, $limit = 10, $offset = 0)
	{
		$rows = $this->query("SELECT * FROM $table ORDER BY created DESC LIMIT $limit OFFSET $offset");
		return ( $rows->rowCount() > 0 ) ? $rows->fetchAll(PDO::FETCH_ASSOC) : false;
	}

	/**
	 * Insert row to database
	 * @param String $table
	 * @param String $columns
	 * @param String $values
	 * @param Array $data
	 */
	public function add($table, $columns, $values, $data)
	{
		$this->query("INSERT INTO {$table}({$columns}) VALUES({$values})", $data);
	}

	/**
	 * Update row in database
	 * @param  String $table
	 * @param  String $columns
	 * @param  Array $data
	 */
	public function update($table, $columns, $data)
	{
		$this->query("UPDATE $table SET $columns WHERE md5 = :md5", $data);
	}

	/**
	 * Remove row from database
	 * @param  String $table
	 * @param  String $slug
	 */
	public function delete($table, $md5)
	{
		$this->query("DELETE FROM $table WHERE md5 = :md5", array(
			'md5' => $md5
		));
	}

	/**
	 * Make query
	 * @param  String $query
	 * @return Array
	 */
	public function request($query)
	{
		$rows = $this->query($query);
		return ( $rows->rowCount() > 0 ) ? $rows->fetchAll(PDO::FETCH_ASSOC) : false;
	}

	/**
	 * Execute specifet SQL query
	 * @param  String $query
	 * @param  Array $bindings
	 * @return Array
	 */
	public function query($query, $bindings = null)
	{
		$stack = $this->conn ->prepare($query);
		$stack->execute($bindings);
		return $stack;
	}

	/**
	 * Making PDO connection
	 */
	private function connect()
	{

		try {
			$this->conn = new PDO(
				"mysql:host=" . $this->host . ";dbname=" . $this->name,
				$this->user,
				$this->pass
			);
			$this->conn ->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
			$this->conn ->query('SET NAMES UTF8');
		} catch(PDOException $e) {
			echo "Error: " . $e->getMessage();
		}

	}

	/**
	 * Constructor
	 * @param String $host Database host
	 * @param String $name Database name
	 * @param String $user Database username
	 * @param String $pass Database user password
	 */
	function __construct($host, $name, $user, $pass)
	{
		$this->host = $host;
		$this->name = $name;
		$this->user = $user;
		$this->pass = $pass;

		$this->connect();
	}
}
