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

	public $host;
	public $name;
	public $user;
	public $pass;
	public $conn;
	public $stack;

	/**
	 * Get specifed row by id
	 * @param  String $table
	 * @param  String $id
	 * @return Array $row
	 */
	public function get($table, $id)
	{
		$row = $this->query("SELECT * FROM $table WHERE id = :id LIMIT 1", array(
			'id' => $id
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
	 * Insert row to database
	 * on duplicate key overwrite
	 * @param String $table
	 * @param String $columns
	 * @param String $values
	 * @param Array $data
	 */
	public function addOverwrite($table, $columns, $values, $update, $data)
	{
		$this->query("INSERT INTO {$table}({$columns}) VALUES({$values}) ON DUPLICATE KEY UPDATE {$update}", $data);
	}

	/**
	 * Update row in database
	 * @param  String $table
	 * @param  String $columns
	 * @param  Array $data
	 */
	public function update($table, $columns, $data)
	{
		$this->query("UPDATE $table SET $columns WHERE id = :id", $data);
	}

	/**
	 * Remove row from database
	 * @param  String $table
	 * @param  String $slug
	 */
	public function delete($table, $id)
	{
		$this->query("DELETE FROM $table WHERE id = :id", array(
			'id' => $id
		));
	}

	/**
	 * Make query
	 * @param  String  $query
	 * @param  Array   $params
	 * @param  Boolean $return Does query returns results?
	 * @return Array
	 */
	public function request($query, $params = array(), $return = true)
	{
		$rows = $this->query($query, $params);

		if ($return)
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
		$this->stack = $this->conn ->prepare($query);
		$this->stack ->execute($bindings);
		return $this->stack;
	}

	/**
	 * Begin database atomic transaction
	 * @return Bool TRUE on success or FALSE on failure.
	 */
	public function beginTransaction()
	{
		return $this->conn->beginTransaction();
	}

	/**
	 * Commit transaction to database
	 * @return Bool TRUE on success or FALSE on failure.
	 */
	public function commitTransaction()
	{
		return $this->conn->commit();
	}

	/**
	 * Rollback transaction from database
	 * @return Bool TRUE on success or FALSE on failure.
	 */
	public function rollbackTransaction()
	{
		return $this->conn->rollback();
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
			$this->conn ->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
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
