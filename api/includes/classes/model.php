<?php

/*
 | ------------------------------------------
 | Base Model Class
 | ------------------------------------------
 | This is general class for creating 
 | application models.
*/
class Model extends Database
{
	
	/**
	 * Database connection
	 * @var [type]
	 */
	protected $db;

	/**
	 * Database table name
	 * @var String
	 */
	protected $table;

	/**
	 * Database table columns
	 * @var String
	 */
	protected $columns;

	/**
	 * Fetch rows from database
	 * @return Array
	 */
	public function fetch()
	{
		return $this->db ->fetch($this->table);
	}

	/**
	 * Get row from database by id
	 * @param  String $id
	 * @return Array
	 */
	public function get($id)
	{
		return $this->db ->get($this->table, $id);
	}

	/**
	 * Remove row from database
	 * @param  String $id 
	 */
	public function delete($id)
	{
		$this->db ->delete($this->table, $id);
	}

	/**
	 * Add row to database
	 * @param  Array $data
	 */
	public function add($data)
	{
		$this->db ->add(
			$this->table,
			$this->columns,
			$this->valuesToAdd(), 
			$data
		);
	}

	/**
	 * Update row in database
	 * @param  Array $data
	 */
	public function update($data)
	{
		$this->db ->update(
			$this->table,
			$this->valuesToUpdate(),
			$data
		);
	}

	/**
	 * Get the next row of currently passed
	 * @param  Array $row
	 * @return Array
	 */
	public function next($row)
	{
		$rows = $this->db ->query("SELECT * FROM $this->table WHERE date > :date ORDER BY date ASC LIMIT 0,1", array(
				'date' => $row['date']
		));

		$nextRow = $rows->fetchAll();

		return ( $rows->rowCount() > 0 ) ? $nextRow[0] : $this->first();
	}

	/**
	 * Get the previous row of currently passed
	 * @param  Array $row
	 * @return Array
	 */
	public function prev($row)
	{
		$rows = $this->db ->query("SELECT * FROM $this->table WHERE date < :date ORDER BY date ASC LIMIT 0,1", array(
				'date' => $row['date']
		));

		$prevRow = $rows->fetchAll();

		return ( $rows->rowCount() > 0 ) ? $prevRow[0] : $this->last();
	}

	/**
	 * Get first row in tabele
	 * @return $row
	 */
	public function first()
	{
		$row = $this->db ->query("SELECT * FROM $this->table ORDER BY date ASC LIMIT 0,1");
		$row = $row->fetchAll();

		return $row[0];
	}

	/**
	 * Get last row in tabele
	 * @return $row
	 */
	public function last()
	{
		$row = $this->db ->query("SELECT * FROM $this->table ORDER BY date DESC LIMIT 0,1");
		$row = $row->fetchAll();
		
		return $row[0];
	}

	/**
	 * Count number of rows in database
	 * @return Int
	 */
	public function count()
	{
		return count( $this->fetch() );
	}

	/**
	 * Prepare columns values for add
	 * @return String
	 */
	public function valuesToAdd()
	{
		return preg_replace("/([A-Za-z0-9]+)/", ":$1", $this->columns);
	}

	/**
	 * Prepare columns values for upadte
	 * @return String
	 */
	public function valuesToUpdate()
	{
		return preg_replace("/([A-Za-z0-9]+)/", "$1 = :$1", $this->columns);
	}

}