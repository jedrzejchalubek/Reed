<?php

/*
 | ------------------------------------------
 | Article Model Class
 | ------------------------------------------
 | General class for access feeds data
*/
class Article extends Model
{
	
	function __construct($db)
	{
		$this->db = $db;
		$this->table = 'Article';
		$this->columns = 'date, title';
	}
	
}