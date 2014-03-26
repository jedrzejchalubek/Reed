<?php

/*
 | ------------------------------------------
 | Home Controller Class
 | ------------------------------------------
*/

class Home extends Controller
{

	/**
	 * Post
	 */
	public function post($id, $query)
	{
		// var_dump( Server::get()['access_token'] );

		$access_token = Server::get()['access_token'];

		// $appsecret_proof = hash_hmac('sha256', $access_token, 'e30a10b27c33467aae28ea0763e5f56e');
		//
		$gg = Request::make("https://graph.facebook.com/me?access_token={$access_token}");
		$tt = json_decode( $gg );

		if ( $tt->verified ) {

			// generuje unikalny token
			$token = sha1( uniqid(microtime(true), true) );

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
