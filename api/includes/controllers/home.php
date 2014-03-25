<?php

/*
 | ------------------------------------------
 | Article Controller Class
 | ------------------------------------------
*/

class Home extends Controller
{

	/**
	 * Get
	 */
	public function get($id, $query)
	{
		if ( $this->user->getProfile() ) {
			// generuje unikalny token
			$token = sha1( uniqid(rand(), true) );
			// zapisuje usera ktory zglosil sie po token
			$userId = $this->user->getId();

			// zapis do bazy tabli user -> userid:token do weryfikacji zapytan
			// ustalić czas wygasania tokenów
			// po wygasnieciu klient bedzie musial sie jeszcze raz zglosic po token

			Response::auth($token);

		}
	}

	/**
	 * Construct
	 * Each controller must construct parent base controller class
	 * @param Object $model Models passed to controller
	 */
	function __construct($models)
	{
		parent::__construct($models);
	}
}
