<?php

/*
 | ------------------------------------------
 | Feed Model Class
 | ------------------------------------------
 | General class for access feeds data
*/
class Feed extends Model
{
	
	function __construct($db)
	{
		$this->db = $db;
		$this->table = 'Feed';
		$this->columns = 'date, title';
	}
	
}